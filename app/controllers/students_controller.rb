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
  
  # Authorisation
  # This uses the method from the projects helper to check if an admin is logged in before
  # granting permission to veiw all and delete a staff from the database
  before_action :admin_logged_in!, only: [:index, :destroy]

  # Authorisation
  # This uses the method from the projects helper to check if a staff is logged in before
  # granting permission to edit or view a staff from the database
  before_action :student_logged_in!, only: [:edit, :update, :show] 

  # index 
  # @students: fetches all the students from the database for output
  def index
    @students = Student.all
  end


  #Create a new Student object
  def new
    @student = Student.new
    @courses = Course.all
    #@projecttags = Project.all
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
      flash[:notice] = "Welcome to the Student Portal"
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
  def show
    set_student

    # check for the presesnce of a logged in student
    if current_student.present?

      # grab the course of the logged in student
      @current_student_course_id = current_student.course_id
      @course = Course.find_by_sql("SELECT course_name FROM courses WHERE courses.id = #{@current_student_course_id}")

      #=============================================
      # RECOMMENDATION

      # interests1 is an array to hold the interests selected from the project_tags
      interests1 = []

      # check for the presence of interests selected from the project_tags for
      # the student, then get the tag names and put them in an array
      if !current_student.project_tags.empty?
        current_student.project_tags.each do |pt|
          # add it to the array
          interests1.push(pt.tag_name.to_s)
        end
      end

      # combined is an array to hold the interests from the projecttags and manually 
      # inputted interest
      combined = []

      # check for the presence of manually inputted tags (from additional_interest field of student)
      if !current_student.additional_interest.blank?
        # interest2 splits the tags by comma too create an array
        interests2 = current_student.additional_interest.split(",")

        # the two arrays (interests1 and interests2) are merger together in 'combined'
        combined = (interests1 << interests2).flatten
      # # if there are no additional_interest(s)  
      elsif !interests1.empty?
        # combined is equal to the interest1 array
        combined = interests1
      end

      # check if combined is not an empty array before computing for the projects 
      if !combined.empty?
        
        # remove all unecessary spaces from combined array and make all downcase
        combined = combined.map{|i| i.to_s.strip.downcase}

        # remove all duplicate keywords from the combined array
        # combined_uniq will store the new array without duplicates
        combined_uniq = []
        
        # iterate through each item in the combinend array and compare each word
        # it it doeas not exist in comined_uniq array, add it to the array
        for i in 0..combined.length
            if !combined_uniq.include?combined[i].to_s
              combined_uniq.push(combined[i])
          end
        end

        # combined_interest is an array to hold the projects from the interest
        # combined_interest = []
        # each project that has the keyword  is stored in the array
        # note that the code has avoided SQl injection problems 
        combined_interest = combined_uniq.map{|i| Project.where("title like ? or description like ? or tags like ?", "%#{i}%", "%#{i}%", "%#{i}%")}

        # array to hold non-duplicate projects which sends data to the view
        @combined_interest_uniq = []

        # iterate over the combined_interest array and remove all dupplicates.
        # This is done by cheking for the presence of the object in combined_interest_uniq
        # array before adding to it.
        combined_interest.each do |i|
          i.each do |j|
            if !@combined_interest_uniq.include? j
              @combined_interest_uniq.push(j)
            end
          end
        end
      end
    
    end


  end



  # edit
  #  this fetches the existing student by the id for editing in the view
  # using the defined private method set_student
  def edit
    set_student
    @courses = Course.all
  end


  # update
  # this fetches the existing student by the id for editing in the view
  # and updates changes to that id
  #
  # if there is an error preventing update, it renders the edit form again
  def update
    set_student
    if @student.update_attributes(edit_params)
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

  # supervisors for the student
  def supervisor
    @supervisors = Allocation.all.order(created_at: :desc).where(student_id: current_student.id)
  end


  # This contains method private to this controller
  private

    # This private method indicates the parameters for the student using the strong params
    def student_params
     params.require(:student).permit(:full_name, :email, :pnumber, :password, :password_confirmation, :course_id, :additional_interest, :level_id, project_tag_ids:[])
    end

    def edit_params
     params.require(:student).permit(:course_id, :additional_interest, :level_id, project_tag_ids:[])
    end

    # This private method fetches a student from  the database by the id
    def set_student
     @student = Student.find(current_student.id)
    end



end