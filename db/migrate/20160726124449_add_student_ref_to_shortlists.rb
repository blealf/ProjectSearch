class AddStudentRefToShortlists < ActiveRecord::Migration
  def change
    add_reference :shortlists, :student, index: true, foreign_key: true
  end
end
