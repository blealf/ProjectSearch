
# this class collects all the applications made by students for a staff
class StudentapplicationsController < ApplicationController
  
  # Authorisation
  # This uses the method from the projects helper to check if a staff is logged in before
  # granting permission to create, edit or delete a project from the database
  before_action :staff_logged_in!, only: [:index, :new, :edit, :show, :update, :destroy]

  # This method gets all project applications that belong to a staff
  def index
  	@student_applications = ProjectApplication.all.order(created_at: :desc).where(staff_id: current_staff.id)

    # creates an array to store the projects that are applied fo
  	@projects = []
		
    # This fetches the project from the database with the project_id
    # stored with the project application during creation.
    # the results are assembled in an array and output on call at the view
  	@student_applications.each do |s|
  		r = Project.where(:id =>s.project_id)
  		@projects.push(r)
  	end
  end

  # def show
  # 	# @student_application = ProjectApplication.find(params[:id])
  # 	# @students = Student.where(id: @student_application.student_id).find_each
  # end
end
