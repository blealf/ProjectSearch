#
# The session controller handles the login and log out of the staff and students
# Staff and student model are defined differently to abstract the one from the other.
#
# In this class both are handled propoerly and using if staements where necessary
#
class SessionsController < ApplicationController
  
  #
  # Used for rendereing a  new seeion page which is the login page
  def new
  end

  # The create method creates a new session for the user:(staff or student)
  def create


    # ==========================================================================
    # staff = Staff.find_by(email: params[:session][:email].downcase)
    # student = Student.find_by(email: params[:session][:email].downcase)
    
    # if staff && staff.authenticate(params[:session][:password])
    # 	log_in staff
    # 	redirect_to staff
    # elsif student && student.authenticate(params[:session][:password])
    #   log_in student
    #   redirect_to student
    # else
    # 	#show error message
    # 	flash.now[:danger] = 'Invalid email/password combination'
    #   	render 'new'
    # end
    # ==========================================================================


    # variable user holds the email of the (staff or student) attempting to login
    user = Staff.find_by(email: params[:session][:email].downcase) || Student.find_by(email: params[:session][:email].downcase)
    
    # This checks if the user exist and authenticates the use using the password
    # which logs in the user with the complete (email and password)
    # and creates the session defined in the sessions helper
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    else
      # show an error message and remain on login page
      flash.now[:danger] = 'Invalid email/password combination'
        render 'new'
    end
  end

  # This method is used to log out an existing user by destroying/deleting the 
  # existing user:(staff or student) session
  # defined in the session helper
  #
  # The user is then redirected to the homepage (root_url)
  def destroy
    log_out
    redirect_to root_url
  end
end
