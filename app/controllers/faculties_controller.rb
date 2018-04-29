class FacultiesController < ApplicationController

  #authorize admin
  before_action :admin_logged_in!, only: [:new, :edit, :update, :destroy]
  
  def index
  	@faculties = Faculty.all.order(:faculty_name)
  end

  def new
  	@faculty = Faculty.new
    @faculties = Faculty.all.order(:faculty_name)
  end

  def create
  	@faculty = Faculty.new(faculties_params)
  	if @faculty.save
  		redirect_to new_faculty_path
  	else
  		render 'new'
  	end
  end

  def show
  	@faculty = Faculty.find(params[:id])
    @departments = @faculty.departments
    #@courses = @departments.courses
  end

  def edit
  	@faculty = Faculty.find(params[:id])
    @faculties = Faculty.all.order(:faculty_name)
  end

  def update 
  	@faculty = Faculty.find(params[:id])
  	if @faculty.update_attributes(faculties_params)
  		redirect_to new_faculty_path
  	else
  		render 'edit'
  	end
  end

  def destroy
  	@faculty = Faculty.find(params[:id])
  	@faculty.destroy
  	redirect_to new_faculty_path
  end

  private
  	def faculties_params
  		params.require(:faculty).permit(:faculty_name)
  	end
end
