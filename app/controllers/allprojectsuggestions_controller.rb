class AllprojectsuggestionsController < ApplicationController

	  # Authorisation
  # This uses the method from the projects helper to check if a Admin is logged in before
  # granting permission
  before_action :admin_logged_in!, only: [:index]
  def index
	# get all project suggestions put up by the student to the staff
	# from the database.
	@projectsuggestions = ProjectSuggestion.all.order(:updated_at)


  end

  def show
  end
end
