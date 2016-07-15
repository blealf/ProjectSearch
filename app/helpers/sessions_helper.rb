module SessionsHelper

  # def log_in(staff)
  #   # if staff.is_a?(Staff)
  # 	   session[:staff_id] = staff.id
  # end

  # #login a student 
  # def log_in (student)
  #   session[:student_id] = student.id
  # end

  #function to login the user:(staff or student)
  def log_in(user)
    
    # This checks if the user is a staff or a student by matching the class and
    # creates a session with the user:(staff or student) id based on the return
    if user.is_a?(Staff)
      session[:staff_id] = user.id
    elsif user.is_a?(Student)
      session[:student_id] = user.id
    end
  end

	#method to check for a currently logged in staff
	def current_staff
  	@current_staff ||= Staff.find_by(id: session[:staff_id])
	end

  


  # *********************************************************************************
  # current_staff and current_user functions are separated here because
  # the output in the view will differ based on the identity of the user logging in
  #
  # There will be need to check if the user is a staff or a student
  # **********************************************************************************

  #check for currently logged in student
  def current_student
    @current_student ||= Student.find_by(id: session[:student_id])
  end

	# boolean function to check if a staff or student is currently logged in
	def logged_in?
  	!current_staff.nil? || !current_student.nil?
	end

	# Logs out the current staff or student by deleting their session and setting the 
  # currnet_staff or current_student variable to nil
	def log_out
  	session.delete(:staff_id) || session.delete(:student_id)

  	@current_staff = nil
    @current_student = nil
	end

end
