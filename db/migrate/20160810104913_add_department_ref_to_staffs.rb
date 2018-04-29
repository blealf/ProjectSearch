class AddDepartmentRefToStaffs < ActiveRecord::Migration
  def change
    add_reference :staffs, :department, index: true, foreign_key: true
  end
end
