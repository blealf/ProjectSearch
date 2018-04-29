class AddFacultyRefToDepartments < ActiveRecord::Migration
  def change
    add_reference :departments, :faculty, index: true, foreign_key: true
  end
end
