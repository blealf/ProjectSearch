class AddDetailsToProjectApplications < ActiveRecord::Migration[4.2]
  def change
    add_column :project_applications, :note, :text
  end
end
