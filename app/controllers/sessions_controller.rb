# The session controller handles the login and log out of the staff and students
# Staff and student model are defined differently to abstract the one from the other.
# In this class both are handled propoerly and using if staements where necessary
# ===============================================================
# PLEASE NOT THAT THE BULK OF THIS CODE WAS GOTTEN FROM
# https://www.railstutorial.org/book/password_reset
# Chapters 8 and 9.
# Although some parts have been modified it is still nearly
# the same.
# ===============================================================
class SessionsController < ApplicationController
  
  # Used for rendereing a  new session page which is the login page
  def new
  end

  # The create method creates a new session for the user:(staff or student)
  def create

    # variable user holds the pnumber of the (staff or student) attempting to login
    user = Staff.find_by(pnumber: params[:session][:pnumber].downcase) || Student.find_by(pnumber: params[:session][:pnumber].downcase) || Admin.find_by(pnumber: params[:session][:pnumber].downcase)
    
    # This checks if the user exist and authenticates the use using the password
    # which logs in the user with the complete (pnumber and password)
    # and creates the session defined in the sessions helper
    if user && user.authenticate(params[:session][:password])
      log_in user
      #params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to user
    else
      # show an error message and remain on login page
      flash.now[:danger] = 'Invalid pnumber/password combination'
        render 'new'
    end
  end

  # This method is used to log out an existing user by destroying/deleting the 
  # existing user:(staff or student) session
  # defined in the session helper
  #
  # The user is then redirected to the homepage (root_url)
  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
