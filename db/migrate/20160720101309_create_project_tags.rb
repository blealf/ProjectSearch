class CreateProjectTags < ActiveRecord::Migration[4.2]
  def change
    create_table :project_tags do |t|
      t.string :tag_name

      t.timestamps null: false
    end
  end
end
