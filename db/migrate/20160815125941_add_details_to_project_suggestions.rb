class AddDetailsToProjectSuggestions < ActiveRecord::Migration
  def change
    add_column :project_suggestions, :note, :text
  end
end
