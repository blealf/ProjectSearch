class AddStaffRefToProjectApplications < ActiveRecord::Migration
  def change
    add_reference :project_applications, :staff, index: true, foreign_key: true
  end
end
