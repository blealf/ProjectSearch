# This contain helper methods used every where in this project
# ===============================================================
# PLEASE NOT THAT THE BULK OF THIS CODE WAS GOTTEN FROM
# https://www.railstutorial.org/book/password_reset
# Chapters 8 and 9.
# Although some parts have been modified it is still nearly
# the same.
# ===============================================================
module SessionsHelper

  #function to login the user:(staff, student or Admin)
  def log_in(user)
    log_out
    # This checks if the user is a staff or a student by matching the class and
    # creates a session with the user:(staff or student) id based on the return
    if user.is_a?(Staff)
      session[:staff_id] = user.id
    elsif user.is_a?(Student)
      session[:student_id] = user.id
    elsif user.is_a?(Admin)
      session[:admin_id] = user.id
    end
  end

  # Remembers a user in a persistent session.
  # def remember(user)
  #   if user.is_a?(Staff)
  #   user.remember
  #   cookies.permanent.signed[:staff_id] = user.id
  #   cookies.permanent[:remember_token] = user.remember_token
  #   elsif user.is_a?(Student)
  #   user.remember
  #   cookies.permanent.signed[:student_id] = user.id
  #   cookies.permanent[:remember_token] = user.remember_token
  #   elsif user.is_a?(Admin)
  #   user.remember
  #   cookies.permanent.signed[:admin_id] = user.id
  #   cookies.permanent[:remember_token] = user.remember_token
  #   end

  #end

  # forget users
  # def forget(user)
  #   if user.is_a?(Staff)
  #     user.forget
  #     cookies.delete(:staff_id)
  #   elsif user.is_a?(Student)
  #     user.forget
  #     cookies.delete(:student_id)
  #   elsif user.is_a?(Admin)
  #     user.forget
  #     cookies.delete(:admin_id)
  #   end
  #   cookies.delete(:remember_token)

  # end

  # check for admin presence
  def current_admin
    @current_admin ||= Admin.find_by(id: session[:admin_id])
  end


  # *********************************************************************************
  # current_staff and current_user functions are separated here because
  # the output in the view will differ based on the identity of the user logging in
  # There will be need to check if the user is a staff or a student
  # **********************************************************************************

  #method to check for a currently logged in staff
  def current_staff
      @current_staff ||= Staff.find_by(id: session[:staff_id])
  end

  #check for currently logged in student
  def current_student
      @current_student ||= Student.find_by(id: session[:student_id])
  end

	# boolean function to check if a staff or student is currently logged in
	def logged_in?
  	!current_staff.nil? || !current_student.nil? || !current_admin.nil?
	end


	# Logs out the current staff, admin or student by deleting their session and setting the 
  # currnet_staff or current_student variable to nil
	def log_out

    # send a mail to the student with their shortlists if they have any
    if current_student.present?
      if !current_student.shortlists.empty?
        @header = "Your project Shortlists "
        @message = "These are your shortlists on #{ Time.now.strftime("%d/%m/%Y %H:%M")}"
        @project = ""
        #send mail to the student
        ProjectMailer.send_information(current_student, current_student, @header, @message, @project).deliver_later
      end
    end

    # delete sessions and forget users
    #forget(current_staff) || forget(current_student) || forget(current_admin)
  	session.delete(:staff_id) || session.delete(:student_id) || session.delete(:admin_id)

  	@current_staff = nil
    @current_student = nil
    @current_admin = nil
	end



    # function to check the presence of an admin
    def admin_logged_in!
      return if current_admin.present?
      
      flash[:alert] = "You must be signed in as an administrator"
      redirect_to login_url
    end

    # function to check the presence of an staff
    def staff_logged_in!
      return if current_staff.present?
      
      flash[:alert] = "You must be signed in as a staff"
      redirect_to login_url
    end

    # function to check the presence of an student
    def student_logged_in!
      return if current_student.present?
      
      flash[:alert] = "You must be signed in as a student"
      redirect_to login_url
    end
end
