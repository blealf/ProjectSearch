class AddDepartmentRefToStaffs < ActiveRecord::Migration[4.2]
  def change
    add_reference :staffs, :department, index: true, foreign_key: true
  end
end
