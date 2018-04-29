# For the about page of the project search system.
# basic CRUD functions
class AboutsController < ApplicationController

  #authorize admin
  before_action :admin_logged_in!, only: [:new, :edit, :update, :destroy]

  def index
  	@abouts = About.all.order(created_at: :desc)
  end

  def new
  	@about = About.new
    @abouts = About.all.order(created_at: :desc)
  end

  def create
  	@about = About.new(about_params)
  	if @about.save
  		redirect_to new_about_path
  	else
  		render 'new'
  	end
  end

  def show
  	set_about
  end

  def edit
  	set_about
    @abouts = About.all.order(created_at: :desc)
  end

  def update
  	@about = About.find(params[:id])
  	if @about.update_attributes(about_params)
  		redirect_to new_about_path
  	else
  		render 'edit'
  	end
  end

  def destroy
  	set_about
  	@about.destroy
  	redirect_to new_about_path
  end

  private
  	def about_params
  		params.require(:about).permit(:title, :description)
  	end
  	def set_about
  		@about = About.find(params[:id])
  	end
end
