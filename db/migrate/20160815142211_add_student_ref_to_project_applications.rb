class AddStudentRefToProjectApplications < ActiveRecord::Migration
  def change
    add_reference :project_applications, :student, index: true, foreign_key: true
  end
end
