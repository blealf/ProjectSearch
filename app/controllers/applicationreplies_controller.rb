class ApplicationrepliesController < ApplicationController
  def index
    @project_application = ProjectApplication.find(params[:project_application_id])
  end

  def new
  end

  def create
    @project_application = ProjectApplication.find(params[:project_application_id])

    person = ""
    reciever = nil
    reply = nil
    if current_staff.present?
      person = current_staff.first_name.capitalize + " " + current_staff.last_name.capitalize
      reciever = @project_application.student
      reply = @project_application.staff
    elsif current_student.present?
      person = current_student.full_name.titleize
      reciever = @project_application.staff
      reply = @project_application.student
    end


  # params[:commenter] = @person
    @applicationreply = @project_application.applicationreplies.new(reply_params)
    @applicationreply.commenter = person
    #@applicationreply.save

    header = "Project Application for #{@project_application.project.title.titleize}"
    message = @applicationreply.note

    if @applicationreply.save
      #send mail to the staff
      SendMailsJob.set(wait: 20.seconds).perform_later(reciever, reply, header, message, @project_application)
      #ProjectMailer.send_information(@reciever, @reply, @header, @message, @project_application).deliver_later
        
      respond_to do |format|
        format.html {redirect_to application_reply_url(@project_application)}
        format.js
     end
    else
      render 'new'
    end
  end
 
  private
    def reply_params
      params.require(:applicationreply).permit(:note, :commenter)
    end

end
