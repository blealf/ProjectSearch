class AddDetailsToStudents < ActiveRecord::Migration
  def change
    add_column :students, :additional_interest, :string
  end
end
