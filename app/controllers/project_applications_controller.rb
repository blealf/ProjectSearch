class ProjectApplicationsController < ApplicationController

	before_action :student_logged_in!, only: [:index, :new, :edit, :show, :destroy]

	def index
		#@project_applications = ProjectApplication.all
		# gets all the project applications for the currently logged in student
		@project_applications = current_student.project_applications.order(created_at: :desc)

		#creates an empty array
		@projects = @project_applications.map{|p| Project.where(:id => p.project_id)}


	end

	def new
		@project_application = ProjectApplication.new
	end
	
	def create

		#retrieve the current project, student, and staff for the project
		#and save them in variables
		@project = Project.find(params[:project_id])
		@student = Student.find(current_student.id)
		@staff = @project.staff

		# this prevents duplication of application by checking if the project 
		# already exists for the student in the view
		@studentapplications = @student.project_applications


		# creates a project application for a project with teh id of the logged in student
		# and id of the staff who owns the project.
  		@project_applications = @project.project_applications.create(student_id: @student.id, staff_id: @staff.id)

  		#creates additional variables for message and header used for 
  		# sending mail to the staff when a student applies
  		message = current_student.full_name
  		header = "Project Application Recieved from #{current_student.full_name.titleize}"
  		
  		#sends mail to the staff using the send_information method from the
  		# ProjectMailer class
  		SendMailsJob.set(wait: 20.seconds).perform_later(@staff, current_student, header, message, @project_applications)
  		#ProjectMailer.send_information(@staff, current_student, @header, @message, @project_applications).deliver

	  	redirect_to project_path(@project), :notice => "Application sent"

	end


  def show
  	@project_application = ProjectApplication.find_by(params[:id])
  end

  def edit
  	@project_application = ProjectApplication.find_by(params[:id])
  end

  def update
  	# @project_application = ProjectApplication.find_by(params[:id])
  	# if @project_application.update_attributes(reply_application)
  	# 	redirect_to studentapplications_path
  	# end
  end

  def destroy
  	@project_application = ProjectApplication.find(params[:id])

	#creates additional variables for message and header used for 
	# sending mail to the staff when a student applies
	@message = current_student.full_name
	@header = "Project Application Withdrawn from #{current_student.full_name.titleize}"
	@staff = Staff.find(@project_application.staff_id)
	#sends mail to the staff using the send_information method from the
	# ProjectMailer class
	ProjectMailer.send_information(@staff, current_student, @header, @message, @project_application).deliver
	#SendMailsJob.set(wait: 20.seconds).perform_later(@staff, current_student, @header, @message, @project_application)
	@project_application.applicationreplies.destroy
  	@project_application.destroy
  	redirect_to project_applications_path, :notice => "Application withdrawn"
  end

	private
		def project_applications_params
			params.require(:project_application).permit(:project_id, :student_id, :staff_id)
		end


	  	def student_logged_in!
			return if current_student.present?
			
			flash[:alert] = "You need to sign in"
			redirect_to login_url
		end

end








