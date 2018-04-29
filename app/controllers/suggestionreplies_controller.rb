class SuggestionrepliesController < ApplicationController
  def index
  	@project_suggestion = ProjectSuggestion.find(params[:project_suggestion_id])
  end

  def new
  end

  def create

    # get the current project suggestion
    @project_suggestion = ProjectSuggestion.find(params[:project_suggestion_id])

    # get the person that is sending the message (staff or student) and attach the name to the message.
    @person = ""
    @reciever = nil
    @reply = nil
  	if current_staff.present?
  		@person = current_staff.first_name.capitalize + " " + current_staff.last_name.capitalize
      @reciever = @project_suggestion.student
      @reply = @project_suggestion.staff
  	elsif current_student.present?
  		@person = current_student.full_name.titleize
      @reciever = @project_suggestion.staff
      @reply = @project_suggestion.student
  	end


    @suggestionreply = @project_suggestion.suggestionreplies.new(reply_params)
    @suggestionreply.commenter = @person



    # @message is the message for the mail (which is the message typed)
    # @header is the subject for the mail
    @message = @suggestionreply.note
    @header = "Project Suggestion #{@project_suggestion.title}"

    #@suggestionreply.save

    if @suggestionreply.save

      #send mail to the staff
      SendMailsJob.set(wait: 20.seconds).perform_later(@reciever, @reply, @header, @message, @project_suggestion)
      #ProjectMailer.send_information(@reciever, @reply, @header, @message, @project_suggestion).deliver_later
    	
      respond_to do |format|
			 format.html {redirect_to suggestion_reply_url(@project_suggestion)}
			 format.js
		  end
    else
    	render 'new'
    end
  end
 
  private
    def reply_params
      params.require(:suggestionreply).permit(:note, :commenter)
    end

end
