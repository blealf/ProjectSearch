class AddStudentRefToProjectApplications < ActiveRecord::Migration[4.2]
  def change
    add_reference :project_applications, :student, index: true, foreign_key: true
  end
end
