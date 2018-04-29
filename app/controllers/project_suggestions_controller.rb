class ProjectSuggestionsController < ApplicationController
  
  # Authorisation
  # This uses the method from the projects helper to check if a student is logged in before
  # granting permission to create, edit or delete a project from the database
  
  before_action :student_logged_in!, only: [:index, :new, :edit, :show, :destroy]
  
  def index
  	@project_suggestions = current_student.project_suggestions.order(created_at: :desc)
  	#@project_suggestions2 = ProjectSuggestion.all
  end

  def new
  	@project_suggestion = ProjectSuggestion.new
  end

  # creates a new project suggestion and sends mail to a staff chosen
  def create

    # variables for course, department and staff are defined.
    # course and department variables are used to get all the staff from
    # the student's department through the students' course to output for
    # choosing when creating the project suggestion.
    @course = current_student.course
    @department = @course.department
    @staffs = @department.staffs

    #creates the project suggestion for the logged in student with the 
    # parameters
  	@project_suggestion = current_student.project_suggestions.build(projectsuggestions_params)
      
      # variables for message and header for the mail
      @message = "Kind regards, \n" + current_student.full_name.titleize + ", #{current_student.course.course_name}"
      @header = "Project Suggestion from #{current_student.full_name.titleize}"
      
    # saves the project suggestion
    if @project_suggestion.save

      #send mail to the staff chosen by the student
      SendMailsJob.set(wait: 20.seconds).perform_later(@project_suggestion.staff, current_student, @header, @message, @project_suggestion)
      #ProjectMailer.send_information(@project_suggestion.staff, current_student, @header, @message, @project_suggestion).deliver
      redirect_to @project_suggestion, :notice => "Saved"
    else
      render 'new'
    end
  end

  # method to fetch the selected project by id to the show view
  def show
  	set_project_suggestion
  end

  def edit
  	set_project_suggestion
  end
  
  # method to update the project suggestion properties.
  def update
  	set_project_suggestion
  	if set_project_suggestion.update_attributes(projectsuggestions_params)
      if current_student.present?
  		  redirect_to set_project_suggestion, :notice => "Saved"
      elsif current_staff.present?
        redirect_to set_project_suggestion, :notice => "Sent"
      end
        
  	else
  		render 'edit'
  	end
  end

  # method to delete the project suggestion selected by the id
  def destroy
  	@project_suggestion = ProjectSuggestion.find(params[:id])
  	@project_suggestion.destroy
  	redirect_to project_suggestions_url, :notice => "Deleted"
  end


  #private methods for this controller
  private
    # holds the strong parameters for the project suggestion
  	def projectsuggestions_params
  		params.require(:project_suggestion).permit(:title, :description, :student_id, :staff_id, :note)
  	end

    # gets a project suggestion by the id
  	def set_project_suggestion
  		@project_suggestion = ProjectSuggestion.find(params[:id])
  	end

end
