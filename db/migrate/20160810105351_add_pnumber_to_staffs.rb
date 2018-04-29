class AddPnumberToStaffs < ActiveRecord::Migration
  def change
    add_column :staffs, :pnumber, :string
  end
end
