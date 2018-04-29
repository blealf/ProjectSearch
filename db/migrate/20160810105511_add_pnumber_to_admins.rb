class AddPnumberToAdmins < ActiveRecord::Migration
  def change
    add_column :admins, :pnumber, :string
  end
end
