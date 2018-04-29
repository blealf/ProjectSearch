# for the help page of the project search system.
# basic CRUD functions
class HelpsController < ApplicationController
  
  #authorize admin
  before_action :admin_logged_in!, only: [:new, :edit, :update, :destroy]

  def index
  	@helps = Help.all.order(created_at: :desc)
  end

  def new
  	@help = Help.new
    @helps = Help.all.order(created_at: :desc)
  end

  def create
  	@help = Help.new(help_params)
  	if @help.save
  		redirect_to new_help_path
  	else
  		render 'new'
  	end
  end

  def show
  	set_help
  end

  def edit
  	set_help
    @helps = Help.all.order(created_at: :desc)
  end

  def update
  	set_help
  	if @help.update_attributes(help_params)
  		redirect_to new_help_path
  	else
  		render 'edit'
  	end
  end

  def destroy
  	set_help
  	@help.destroy
  	redirect_to new_help_path
  end

  private
  	def help_params
  		params.require(:help).permit(:title, :description)
  	end
  	def set_help
  		@help = Help.find(params[:id])
  	end
end
