class AddDetailsToStudents < ActiveRecord::Migration[4.2]
  def change
    add_column :students, :additional_interest, :string
  end
end
