#
# The staffs controller controlls the dynamic page for the staffs view
# It communicates directly with the Staff class which communicates with the database
#
# The main purpose of ths controller is to create, edit, delete, update and view all staff created
#
#
#
# ===========================================================================
# *******************(as well as login a staff after signup)*****************
# ===========================================================================
#
#
#
#
#
class StaffsController < ApplicationController
  
  # Authorisation
  # This uses the method from the projects helper to check if an admin is logged in before
  # granting permission to veiw all and delete a staff from the database
  before_action :admin_logged_in!, only: [:index, :destroy]

  # Authorisation
  # This uses the method from the projects helper to check if a staff is logged in before
  # granting permission to edit or view a staff from the database
  before_action :staff_logged_in!, only: [:edit, :update, :show]  

  # index 
  # @staffs: fetches all the staffs from the database for output
  def index
  	@staffs = Staff.all
  end

  #Create a new Staff object
  def new
  	@staff = Staff.new
  end

  # create
  # This creates a new instance of the staff class for variable @staff
  #
  # The strong parameter function staff_params is used here which includes the staff names
  # email and password
  # it then saves the value to the database
  #
  # The if statement ensures that if it is not saves the new staff page
  def create
  	@staff = Staff.new(staff_params)
  	if @staff.save
      log_in @staff
  		redirect_to @staff
  		# flash[:success] = "Welcome to the Staff Portal"
  	else
  		render 'new'
  	end
  end

  # show 
  # set_staff is a private method which
  # fetches the data about a staff using the id of that staff
  # when the staff is clicked in the web page, the information specific
  # to that staff is yielded.
  #
  # @projects fetches all the projects for a particular staff this is based on the
  # relationship between the staff and project class
  # 
  def show
  	set_staff
  	@projects = set_staff.projects.order(created_at: :desc)
    @student_suggestions = ProjectSuggestion.where("staff_id = ?", current_staff.id)
    #@projects = Project.where(:staff_id => current_staff.id)
    #@projects = set_staff.projects.paginate(page: params[:page])
  end

  # edit
  #  this fetches the existing staff by the id for editing in the view
  # using the defined private method set_staff
  def edit
  	set_staff
  end

  # update
  # this fetches the existing staff by the id for editing in the view
  # and updates changes to that id
  #
  # if there is an error preventing update, it renders the edit form again
  def update
    @staff = Staff.find(params[:id])
    if @staff.update_attributes(staff_edit_params)
      redirect_to @staff
    else
      render 'edit'
    end
  end
  
  # destroy
  # This method is used to delete a staff from the database
  #
  # The staff is fetched buy the id
  # And after delete, the web page is routed to the 
  # staff index page located at staffs_path
  def destroy
  	@staff = Staff.find(params[:id])
  	@staff.destroy
  	redirect_to staffs_path
  end

  # to show the supervisions for the staff
  def supervision
    @supervisions = Allocation.all.order(created_at: :desc).where(staff_id: current_staff.id)
  end

  # This contains method private to this controller
  private

    # This private method indicates the parameters for the staff using the strong params
    def staff_params
  	 params.require(:staff).permit(:first_name, :last_name, :email, :pnumber, :password, :password_confirmation, :office_tel, :profile, :department_id)
    end

    def staff_edit_params
      params.require(:staff).permit(:email, :profile, :office_tel,)
    end

    # This private method fetches a staff from  the database by the id
    def set_staff
  	 @staff = Staff.find(current_staff.id)
    end
end




