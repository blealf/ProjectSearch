class DepartmentsController < ApplicationController

  #authorize admin
  before_action :admin_logged_in!, only: [:new, :edit, :update, :destroy]
  
  def index
  	@departments = Department.all.order(:department_name)
  end

  def new
  	@department = Department.new
    @departments = Department.all.order(:department_name)
  end

  def create
  	@department = Department.new(departments_params)
  	if @department.save
  		redirect_to new_department_path
  	else
  		render 'new'
  	end
  end

  def show
  	@department = Department.find(params[:id])
    @courses = @department.courses
  end

  def edit
  	@department = Department.find(params[:id])
    @departments = Department.all.order(:department_name)
  end

  def update 
  	@department = Department.find(params[:id])
  	if @department.update_attributes(departments_params)
  		redirect_to new_department_path
  	else
  		render 'edit'
  	end
  end

  def destroy
  	@department = Department.find(params[:id])
  	@department.destroy
  	redirect_to new_department_path
  end

  private
  	def departments_params
  		params.require(:department).permit(:department_name, :faculty_id)
  	end
end
