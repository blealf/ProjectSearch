#
# The Courses controller controlls the dynamic page for the projects view
# It communicates directly with the Course class which communicates with the database
#
# The main purpose of ths controller is to create, edit, delete, update projects
# as well as search and filter projects
#
#
class ProjectsController < ApplicationController
  
  # Authorisation
  # This uses the method from the projects helper to check if a staff is logged in before
  # granting permission to create, edit or delete a project from the database
  before_action :staff_logged_in!, only: [:new, :edit, :update, :destroy]


  def projecthome
    index
  end

  # This method handles the index page view
  # It searches all projects and provides filters
  def index
    student_shortlist

    # defines a variable @categories used in the _project.html.erb partial view for
    # outputting all categories
    @categories = Category.all
    #@shortlists = current_student.shortlists
    
        #order_by(:title, :desc)
        #order_by(:created_at, :desc)
        #**********************************************************************
        
        #paginate(page: params[:page], :per_page => 5)

    @search = Project.search(:include => [:staff]) do
      keywords(params[:q])
      with(:visible, true)

      # fetches the facet on the firstname of the staff
      # categoryname for the categories, facultyname for faculty, 
      # departmentname for the department, coursename for the courses
      # and levelname for level models

      facet(:fullname, :coursename, :categoryname, :departmentname, :facultyname, :levelname)

      # this part includes the facets as filters for the search results
      # if it is selected in from the interface (view)
      with(:fullname, params[:fname]) if params[:fname].present?
      with(:categoryname, params[:catname]) if params[:catname].present?
      with(:coursename, params[:couname]) if params[:couname].present?
      with(:departmentname, params[:deptname]) if params[:deptname].present?
      with(:facultyname, params[:facname]) if params[:facname].present?
      with(:levelname, params[:levname]) if params[:levname].present?

      # with(:date_earliest, params[:date_e]) if params[:date_e].present?
      # with(:date_latest, params[:date_l]) if params[:date_l].present?

      #order_by(params[:date_earliest] || :title)
      #order_by(params[:date_earliest]) if params[:date_e].present?
      #order_by(params[:date_latest]) if params[:date_l].present?
    end


    # assigns the @projects variable to the result of the search results
    #@projects = @search.results

    # This code snippet is gotten from:
    # http://stackoverflow.com/questions/27064993/how-to-use-will-paginate-with-sunspot-solr
    # this uses the will_paginate gem to paginate the results of the search.
    @per_page = params[:per_page] || 5
    @projects = Project.where(id: @search.hits.map(&:primary_key)).order(created_at: :desc).paginate(page: params[:page] || 1, :per_page => @per_page)

    #@projects = @projects.order(params[:order])
    
  end


  # new
  # Create a new Project instance
  def new
    @project = Project.new
    @categories = Category.all
  end

  # create
  # This creates a new instance of the Course class for variable @project
  # It creates the project for the current_staff and adds the current staff id
  # to the staff_id field for the project created
  #
  # The strong parameter function project_params is used here which includes the 
  # :title, :description, :tags, :url, :staff_id, :category_id, course_ids:[]
  # it then saves the value to the database
  #
  # The if statement ensures that if it is not saves the new project page
  def create
    

    #@project = Project.new(project_params)
    @project = current_staff.projects.build(project_params)
    

    #@project.staff_id = current_staff.id
    if @project.save
      redirect_to @project, :notice => "Saved"
    else
      render 'new'
    end
  end

  # show 
  # set_project is a private method which
  # fetches the data about a project using the id of that project
  # when the project is clicked in the web page, the information specific
  # to that project is yielded.
  #
  # @courses fetches all the courses for a particular project this is based on the
  # relationship between the project and course class
  # 
  def show

  	set_project
    student_shortlist



    #get all course matching for a project
    @courses = set_project.courses

    #get all project tags for a project
    @project_tags = set_project.project_tags
  end

  # edit
  # this fetches the existing project by the id for editing in the view
  # using the defined private method set_project
  def edit
  	set_project
  end

  # update
  # this fetches the existing project by the id for editing in the view
  # and updates changes to that id.
  # if there is an error preventing update, it renders the edit form again
  def update
  	if set_project.update(project_params)
  		redirect_to staff_path(current_staff.id)
  	else
  		render 'edit'
  	end
  end

  # destroy
  # This method is used to delete a project from the database
  #
  # The project is fetched buy the id
  # And after delete, the web page is routed to the 
  # project index page located at projects_path
  def destroy
  	set_project
  	@project.destroy

  	redirect_to current_staff
  end

  # This contains method private to this controller
  private

    # This private method indicates the parameters for the course using the strong params
  	def project_params
  		params.require(:project).permit(:title, :description, :tags, :url, :staff_id, :category_id, :level_id, :visible, course_ids:[], project_tag_ids:[])
  	end
  	
    # This private method fetches a course from  the database by the id
  	def set_project
  		@project = Project.find(params[:id])
  	end

    # def new_shortlists
    #   @shortlist = Shortlist.new
    #   @shortlist = current_student.shortlists.build(params[:project_id])
    #   @shortlist.save
    #   # if @shortlist.save
    #   #   redirect_to set_project
    #   # else
    #   #   redirect_to set_project
    #   # end
    # end

    def student_shortlist
      #find all shortlists and project applications 
      # for the currently logged in student to prevent
      #duplicate entries
      if current_student.present?
        @stushort = current_student.shortlists
        @studentapplications = current_student.project_applications
      end
  end
end
