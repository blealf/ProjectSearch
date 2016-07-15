#
# The students controller controlls the dynamic page for the students view
# It communicates directly with the Student class which communicates with the database
#
# The main purpose of ths controller is to create, edit, delete, update and view all student created
#
#
#
# ===========================================================================
# *******************(as well as login a student after signup)***************
# ===========================================================================
#
#
#
#
#
class StudentsController < ApplicationController
  
  # index 
  # @students: fetches all the students from the database for output
  def index
    @students = Student.all
  end

  #Create a new Student object
  def new
    @student = Student.new
  end

  # create
  # This creates a new instance of the student class for variable @student
  #
  # The strong parameter function student_params is used here which includes the student names
  # email and password
  # it then saves the value to the database
  #
  # The if statement ensures that if it is not saves the new student page
  def create
    @student = Student.new(student_params)
    if @student.save
      log_in @student
      redirect_to @student
      flash[:success] = "Welcome to the Student Portal"
    else
      render 'new'
    end
  end

  # show 
  # set_student is a private method which
  # fetches the data about a student using the id of that student
  # when the student is clicked in the web page, the information specific
  # to that student is yielded.
  #
  # 
  def show
    set_student
  end

  # edit
  #  this fetches the existing student by the id for editing in the view
  # using the defined private method set_student
  def edit
    set_student
  end

  # update
  # this fetches the existing student by the id for editing in the view
  # and updates changes to that id
  #
  # if there is an error preventing update, it renders the edit form again
  def update
    @student = Student.find(params[:id])
    if @student.update_attributes(student_params)
      redirect_to @student
    else
      render 'edit'
    end
  end
  
  # destroy
  # This method is used to delete a student from the database
  #
  # The student is fetched buy the id
  # And after delete, the web page is routed to the 
  # student index page located at students_path
  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    redirect_to students_path
  end

  # This contains method private to this controller
  private

    # This private method indicates the parameters for the student using the strong params
    def student_params
     params.require(:student).permit(:full_name, :email, :password, :password_confirmation, :office_tel)
    end

    # This private method fetches a student from  the database by the id
    def set_student
     @student = Student.find(params[:id])
    end
end
