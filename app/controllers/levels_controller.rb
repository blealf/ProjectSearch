#
# The Levels controller controlls the dynamic page for the project levels
# It communicates directly with the Level class which communicates with the database
#
# The main purpose of ths controller is to create, edit, delete, update and view all levels created
#
#
class LevelsController < ApplicationController

  #authorize admin
  before_action :admin_logged_in!, only: [:new, :edit, :update, :destroy]

  # index 
  # @levels: fetches all the levels from the database for output
  def index
  	@levels = Level.all
  end

  # new
  # This creates a new instance of the Level class for variable @level
  def new
    @level = Level.new
    @levels = Level.all
  end

  # create
  # This creates a new instance of the Level class for variable @level
  #
  # The strong parameter function is used here which includes the level_name
  # it then saves the value to the database
  #
  # The if statement ensures that if it is not saves the new level page
  # or form will be shown again.
  def create
    @level = Level.new(level_params)

    if @level.save
      redirect_to new_level_path
    else
      render 'new'
    end
  end

  # show 
  # @level: fetches the data about a level using the id of that level
  # when the level is clicked in the web page, the information specific
  # to that level is yielded.
  #
  # @projects fetches all the projects for a particular level this is based on the
  # has_many relationship inthe Project class and belongs_to relationship in the Level class.
  # 
  def show
    @level = Level.find(params[:id])
    @projects = @level.projects
  end


  # edit
  #  this fetches the existing level by the id for edit
  def edit
  	@level = Level.find(params[:id])
    @levels = Level.all
  end

  # update
  # this fetches the existing level by the id for editing in the view
  # and updates changes to that id
  #
  # if there is an error preventing update, it renders the edit form again
  def update
  	@level = Level.find(params[:id])
  	if @level.update_attributes(level_params)
  		redirect_to new_level_path
  	else
  		render 'edit'
  	end
  end

  # destroy
  # This method is used to delete a level from the database
  #
  # The level is fetched buy the id
  # And after delete, the web page is routed to the 
  # level index page located at levels_path
	def destroy
		@level = Level.find(params[:id])
		@level.destroy
		redirect_to new_level_path
	end

  # This contains method private to this controller
  private

    # This private method indicates the parameters for the level using the strong params
  	def level_params
  		params.require(:level).permit(:level_name)
  	end
end
