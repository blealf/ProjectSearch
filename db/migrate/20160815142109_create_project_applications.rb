class CreateProjectApplications < ActiveRecord::Migration[4.2]
  def change
    create_table :project_applications do |t|

      t.timestamps null: false
    end
  end
end
