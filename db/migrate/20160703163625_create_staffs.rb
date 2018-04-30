class CreateStaffs < ActiveRecord::Migration[4.2]
  def change
    create_table :staffs do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.string :remember_digest
      t.string :office_tel

      t.timestamps null: false
    end
    add_index :staffs, :email, unique: true
    add_index :staffs, [:first_name, :last_name]
  end
end
