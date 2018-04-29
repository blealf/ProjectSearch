class ShortlistsController < ApplicationController

	# validation for shortlists. A student must be logged in to create a shortlist.
	before_action :student_logged_in!, only: [:index, :new, :edit, :update, :destroy]

	def index
		# gets all shortlists for the current student
		@shortlists = current_student.shortlists

	end

	def new
		@shortlist = Shortlist.new
	end
	
	# create shortlist method
	def create

		#This finds the current project and student
    	@project = Project.find(params[:project_id])
		@student = Student.find(current_student.id)

		# This ensures that a student doesn't shortlists a project twice by mistake
		# so, @stushort is used in the view to check if there is already an entry for the student.
		# If there is, the apply button is disabled
		@stushort = @student.shortlists

		# Creates shortlists on a project for a student with the project id and the students id
  		@shortlists = @project.shortlists.create(student_id: @student.id)
      	
      	
      	#redirect_to projects_path
      	redirect_to(:back)

	end


  def destroy
  	@shortlist = Shortlist.find(params[:id])
  	@shortlist.destroy
  	redirect_to shortlists_path
  end

	private
		# def shortlists_params
		# 	params.require(:shortlist).permit(:project_id, :student_id)
		# end

		# This methods checks for the presence 
		# of a student
	  	def student_logged_in!
			return if current_student.present?
			
			flash[:alert] = "You need to sign in"
			redirect_to login_url
		end

end


#count = 0
# @stushort.each do |s|
# 	if s.project_id == @project.id
# 		count = count+1
# 	end
# end
# if count == 0
#end