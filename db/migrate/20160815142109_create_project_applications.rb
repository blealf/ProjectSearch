class CreateProjectApplications < ActiveRecord::Migration
  def change
    create_table :project_applications do |t|

      t.timestamps null: false
    end
  end
end
