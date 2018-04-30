class AddPnumberToStaffs < ActiveRecord::Migration[4.2]
  def change
    add_column :staffs, :pnumber, :string
  end
end
