#
# The interests controller controlls the dynamic page for the interests view
# It communicates directly with the interest class which communicates with the database
#
# The main purpose of ths controller is to create, edit, delete, update and view all interests created
#
#
class InterestsController < ApplicationController
  
  # index 
  # @interests: fetches all the interests from the database for output  
  def index
  	@interests = Interest.all
  end

  # new
  # Create a new Interest instance
  def new
    @interest = Interest.new
  end

  # create
  # This creates a new instance of the interest class for variable @interest
  #
  # The strong parameter function is used here which includes the interest_name
  # it then saves the value to the database
  #
  # The if statement ensures that if it is not saves the new interest page
  def create
    @interest = Interest.new(interest_params)
    if @interest.save
      redirect_to @interest
    else
      render 'new'
    end
  end

  # show 
  # set_interest is a private method which
  # fetches the data about a interest using the id of that interest
  # when the interest is clicked in the web page, the information specific
  # to that interest is yielded.
  # 
  def show
  	set_interest
  end

  # edit
  #  this fetches the existing interest by the id for editing in the view
  # using the defined private method set_interest
  def edit
  	set_interest
  end

  # update
  # this fetches the existing interest by the id for editing in the view
  # and updates changes to that id
  #
  # if there is an error preventing update, it renders the edit form again
  def update
  	@interest = Interest.find(params[:id])
  	if @interest.update_attributes(interest_params)
  		redirect_to @interest
  	else
  		render 'edit'
  	end
  end

  # destroy
  # This method is used to delete a interest from the database
  #
  # The interest is fetched buy the id
  # And after delete, the web page is routed to the 
  # interest index page located at interests_path
  def destroy
  	@interest = Interest.find(params[:id])
  	@interest.destroy
  	redirect_to interests_path
  end

 # This contains method private to this controller
  private

    # This private method indicates the parameters for the interest using the strong params
  	def interest_params
  		params.require(:interest).permit(:interest_name)
  	end

    # This private method fetches an interest from  the database by the id
    def set_interest
      @interest = Interest.find(params[:id])
    end
end
