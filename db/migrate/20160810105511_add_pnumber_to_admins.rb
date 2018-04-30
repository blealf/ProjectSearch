class AddPnumberToAdmins < ActiveRecord::Migration[4.2]
  def change
    add_column :admins, :pnumber, :string
  end
end
