class AddFacultyRefToDepartments < ActiveRecord::Migration[4.2]
  def change
    add_reference :departments, :faculty, index: true, foreign_key: true
  end
end
