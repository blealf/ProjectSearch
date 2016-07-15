class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :full_name
      t.string :email
      t.string :password_digest

      t.timestamps null: false
    end
    add_index :students, :email, unique: true
    add_index :students, [:full_name]
  end
end
