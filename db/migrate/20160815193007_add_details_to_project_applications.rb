class AddDetailsToProjectApplications < ActiveRecord::Migration
  def change
    add_column :project_applications, :note, :text
  end
end
