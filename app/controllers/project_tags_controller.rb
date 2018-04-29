class ProjectTagsController < ApplicationController

  #authorize admin
  before_action :admin_logged_in!, only: [:index, :show, :new, :edit, :update, :destroy]
  
  def index
  	@project_tags = ProjectTag.all.order(:tag_name)
  end

  def new
  	@project_tag = ProjectTag.new
    @project_tags = ProjectTag.all.order(:tag_name)

  end

  def create
  	@project_tag = ProjectTag.new(projecttag_params)
  	if @project_tag.save
  		redirect_to new_project_tag_path
  	else
  		render 'new'
  	end
  end

  def show
  	set_project_tag
  end

  def edit
  	set_project_tag
    @project_tags = ProjectTag.all.order(:tag_name)
  end

  def update
  	@project_tag = ProjectTag.find(params[:id])
  	if @project_tag.update_attributes(projecttag_params)
  		redirect_to new_project_tag_path
  	else
  		render 'edit'
  	end
  end

  def destroy
  	@project_tag = ProjectTag.find(params[:id])
  	@project_tag.destroy
  	redirect_to new_project_tag_path
  end

  private

  	def projecttag_params
  		params.require(:project_tag).permit(:tag_name)
  	end

  	def set_project_tag
  		@project_tag = ProjectTag.find(params[:id])
  	end

end
