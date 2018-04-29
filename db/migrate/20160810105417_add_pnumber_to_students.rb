class AddPnumberToStudents < ActiveRecord::Migration
  def change
    add_column :students, :pnumber, :string
  end
end
