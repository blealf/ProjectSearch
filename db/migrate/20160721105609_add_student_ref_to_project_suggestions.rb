class AddStudentRefToProjectSuggestions < ActiveRecord::Migration
  def change
    add_reference :project_suggestions, :student, index: true, foreign_key: true
  end
end
