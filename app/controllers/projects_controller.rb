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

  # This method handles the index page view
  # It searches all projects and provides filters
  def index

    # defines a variable @categories used in the _project.html.erb partial view for
    # outputting all categories
  	@categories = Category.all
    

    @search = Project.search(:include => [:staff]) do
      keywords(params[:q])
      
      #================================================================
      # exclusions = []
      # if params[:name].present?
      #       exclusions << with(:firstname, params[:name])
      # end
      #
      # if params[:cname].present?
      #       exclusions << with(:categoryname, params[:cname])
      # end
      #
      # exclusions.compact!
      # exclusions = nil if exclusions.empty?
      # facet (:firstname, :exclude => exclusions, :name => :firsname)
      #:exclude => exclusions, :name => :all_categories
      #with(:firstname, params[:name]) if params[:name].present?
      #facet(:categoryname, :exclude => exclusions, :cname => :categoryname)
      #========================================================================

      # defines a facet on the firstname of the staff
      # categoryname for the categories
      # and coursename for the courses
      facet(:fullname, :coursename, :categoryname)

      # this is used to filter the search results 
      # when the filters are used in the page
      with(:fullname, params[:fname]) if params[:fname].present?
      with(:categoryname, params[:catname]) if params[:catname].present?
      with(:coursename, params[:couname]) if params[:couname].present?


      #**********************************************************************
      # this uses the will_paginate gem to paginate the results of the search.
      paginate(page: params[:page], :per_page => 15)
    end

    # =======================================================================
    # if params[:q].blank?
    #   @projects = Project.all
    # else
    #   @projects = @search.results
    # end
    # =======================================================================

    # assigns the @projects variable to the result of the search results
    @projects = @search.results
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
    @courses = set_project.courses
  end

  # edit
  # this fetches the existing project by the id for editing in the view
  # using the defined private method set_project
  def edit
  	set_project
  end

  # update
  # this fetches the existing project by the id for editing in the view
  # and updates changes to that id
  #
  # if there is an error preventing update, it renders the edit form again
  def update
  	if set_project.update(project_params)
  		redirect_to set_project
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

  	redirect_to projects_path
  end

  # This contains method private to this controller
  private

    # This private method indicates the parameters for the course using the strong params
  	def project_params
  		params.require(:project).permit(:title, :description, :tags, :url, :staff_id, :category_id, course_ids:[])
  	end
  	
    # This private method fetches a course from  the database by the id
  	def set_project
  		@project = Project.find(params[:id])
  	end

end
