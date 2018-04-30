class AddPnumberToStudents < ActiveRecord::Migration[4.2]
  def change
    add_column :students, :pnumber, :string
  end
end
