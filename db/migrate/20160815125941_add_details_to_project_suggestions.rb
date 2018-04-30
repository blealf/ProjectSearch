class AddDetailsToProjectSuggestions < ActiveRecord::Migration[4.2]
  def change
    add_column :project_suggestions, :note, :text
  end
end
