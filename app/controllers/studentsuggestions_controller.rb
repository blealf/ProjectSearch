# This class gets all project suggestion for made by students to a staff
class StudentsuggestionsController < ApplicationController

  # Authorisation
  # This uses the method from the projects helper to check if a staff is logged in before
  # granting permission to create, edit or delete a project from the database
  before_action :staff_logged_in!, only: [:index, :new, :edit, :show, :update, :destroy]
  
  # This method gets all projects suggestions that belong to a staff
  def index
    @f = ProjectSuggestion.all.order(:created_at)
  	@student_suggestions = ProjectSuggestion.all.order(created_at: :desc).where("staff_id = ?", current_staff.id)
  end

  # def edit
  # end

  # def new
  # end
end
