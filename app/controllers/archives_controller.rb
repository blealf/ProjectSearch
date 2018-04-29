class ArchivesController < ApplicationController
  def index
  	@archives = Archive.all.order(created_at: :desc).where(staff_id: current_staff.id)
  	#@student_applications = ProjectApplication.all.order(created_at: :desc).where(staff_id: current_staff.id)
  	@projects = []
  	if !@archives.empty?
  		@student_applications = @archives.map{|sa| ProjectApplication.find(sa.project_application_id)}
  	
	    # creates an array to store the projects that are applied fo
	  	
			
	    # This fetches the project from the database with the project_id
	    # stored with the project application during creation.
	    # the results are assembled in an array and output on call at the view
	  	@student_applications.each do |s|
	  		r = Project.where(:id =>s.project_id)
	  		@projects.push(r)
	  	end
  	end
  end

  def new
  end

  def create
	#This finds the current project and student
	@project_application = ProjectApplication.find(params[:project_application_id])

	# Creates archive of project application
	@archive = @project_application.archives.create(staff_id: current_staff.id)
  	if @archive.save
  		@project_application.destroy
  		redirect_to(:back)
  	end
  end

  	def destroy
  		@archive = Archive.find(params[:id])
  		@achive.destroy
  		redirect_to archives_path
  	end

end
