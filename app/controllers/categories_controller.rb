#
# The Categories controller controlls the dynamic page for the project categories
# It communicates dirrectly with the Category class which communicates with the database
#
# The main purpose of ths controller is to create, edit, delete, update and view all categories created
#
#
class CategoriesController < ApplicationController

  # index 
  # @categories: fetches all the categories from the database for output
  def index
  	@categories = Category.all
  end

  # new
  # This creates a new instance of the Category class for variable @category
  def new
    @category = Category.new
  end

  # create
  # This creates a new instance of the Category class for variable @category
  #
  # The strong parameter function is used here which includes the category_name
  # it then saves the value to the database
  #
  # The if statement ensures that if it is not saves the new category page
  # or form will be shown again.
  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to @category
    else
      render 'new'
    end
  end

  # show 
  # @category: fetches the data about a category using the id of that category
  # when the category is clicked in the web page, the information specific
  # to that category is yielded.
  #
  # @projects fetches all the projects for a particular category this is based on the
  # has_many relationship inthe Project class and belongs_to relationship in the Category class.
  # 
  def show
    @category = Category.find(params[:id])
    @projects = @category.projects
  end


  # edit
  #  this fetches the existing category by the id for edit
  def edit
  	@category = Category.find(params[:id])
  end

  # update
  # this fetches the existing category by the id for editing in the view
  # and updates changes to that id
  #
  # if there is an error preventing update, it renders the edit form again
  def update
  	@category = Category.find(params[:id])
  	if @category.update_attribute(category_params)
  		redirect_to @category
  	else
  		render 'edit'
  	end
  end

  # destroy
  # This method is used to delete a category from the database
  #
  # The category is fetched buy the id
  # And after delete, the web page is routed to the 
  # category index page located at categories_path
	def destroy
		@category = Category.find(params[:id])
		@category.destroy
		redirect_to categories_path
	end

  # This contains method private to this controller
  private

    # This private method indicates the parameters for the category using the strong params
  	def category_params
  		params.require(:category).permit(:category_name)
  	end
end
