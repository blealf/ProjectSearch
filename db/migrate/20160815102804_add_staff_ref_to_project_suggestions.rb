class AddStaffRefToProjectSuggestions < ActiveRecord::Migration
  def change
    add_reference :project_suggestions, :staff, index: true, foreign_key: true
  end
end
