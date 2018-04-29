class AddDetailsToStaffs < ActiveRecord::Migration
  def change
    add_column :staffs, :profile, :string
  end
end
