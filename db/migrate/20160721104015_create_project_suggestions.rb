class CreateProjectSuggestions < ActiveRecord::Migration
  def change
    create_table :project_suggestions do |t|
      t.string :title
      t.text :description

      t.timestamps null: false
    end
  end
end
