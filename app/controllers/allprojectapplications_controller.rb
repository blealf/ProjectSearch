class AllprojectapplicationsController < ApplicationController
  
  	  # Authorisation
  # This uses the method from the projects helper to check if a Admin is logged in before
  # granting permission
  before_action :admin_logged_in!, only: [:index]
  
  def index
  	# get all project application made from the database
		@project_applications = ProjectApplication.all
		@projects = @project_applications.map{|p| Project.where(:id =>p.project_id)}
		
		#creates an empty array
		# @projects = []
		# @project_applications.each do |s|
		# 	# finds the project by id and add it to the array
		# 	@r = Project.where(:id =>s.project_id)
		# 	@projects.push(@r)
		# end
  end

end
