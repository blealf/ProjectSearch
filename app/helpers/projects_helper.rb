module ProjectsHelper
	
	# This checks if staff is present before allowing to create projects
	# used in the projects controller
	def staff_logged_in!
		return if current_staff.present?
		
		flash[:alert] = "You need to sign in"
		redirect_to login_url
	end
end
