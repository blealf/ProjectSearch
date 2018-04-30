class AddDetailsToStaffs < ActiveRecord::Migration[4.2]
  def change
    add_column :staffs, :profile, :string
  end
end
