class AddProjectRefToProjectApplications < ActiveRecord::Migration
  def change
    add_reference :project_applications, :project, index: true, foreign_key: true
  end
end
