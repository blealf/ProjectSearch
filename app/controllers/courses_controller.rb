#
# The Courses controller controlls the dynamic page for the projects view
# It communicates directly with the Course class which communicates with the database
#
# The main purpose of ths controller is to create, edit, delete, update and view all projects created
#
#
class CoursesController < ApplicationController

  #authorize admin
  before_action :admin_logged_in!, only: [:new, :edit, :update, :destroy]

  # index 
  # @courses: fetches all the courses from the database for output
  def index
    @per_page = params[:per_page] || 10
  	@courses = Course.all.order(:course_name).paginate(page: params[:page] || 1, :per_page => @per_page)
  end

  # new
  # Create a new Course instance
  def new
  	@course = Course.new
    @per_page = params[:per_page] || 10

    @courses = Course.all.order(:course_name).paginate(page: params[:page] || 1, :per_page => @per_page)
  end
  
  # create
  # This creates a new instance of the Course class for variable @course
  #
  # The strong parameter function course_params is used here which includes the course_name
  # it then saves the value to the database
  #
  # The if statement ensures that if it is not saves the new course page
  def create
  	@course = Course.new(course_params)
  	if @course.save
  		redirect_to new_course_path
  	else
  		render 'new'
  	end
  end

  # show 
  # set_course is a private method which
  # fetches the data about a course using the id of that course
  # when the course is clicked in the web page, the information specific
  # to that course is yielded.
  #
  # @projects fetches all the projects for a particular course this is based on the
  # relationship between the course and project class
  # 
  def show
  	set_course
    @per_page = params[:per_page] || 10
  	@projects = set_course.projects.paginate(page: params[:page] || 1, :per_page => @per_page)
  end

  # edit
  #  this fetches the existing course by the id for editing in the view
  # using the defined private method set_course
  def edit
  	set_course
    @per_page = params[:per_page] || 10
    @courses = Course.all.order(:course_name).paginate(page: params[:page] || 1, :per_page => @per_page)
  end

  # update
  # this fetches the existing course by the id for editing in the view
  # and updates changes to that id
  #
  # if there is an error preventing update, it renders the edit form again
  def update
    @course = Course.find(params[:id])
    if @course.update_attributes(course_params)
      redirect_to new_course_path
    else
      render 'edit'
    end
  end
  
  # destroy
  # This method is used to delete a course from the database
  #
  # The course is fetched buy the id
  # And after delete, the web page is routed to the 
  # course index page located at courses_path
  def destroy
  	@course = Course.find(params[:id])
  	@course.destroy
  	redirect_to new_course_path
  end

  # This contains method private to this controller
  private

  # This private method indicates the parameters for the course using the strong params
  def course_params
  	params.require(:course).permit(:course_name, :department_id)
  end

  # This private method fetches a course from  the database by the id
  # or by the course_id of the current student
  def set_course
    if current_student.present?
  	   @course = Course.find(current_student.course_id)
    else
      @course = Course.find(params[:id])
    end

  end

end
