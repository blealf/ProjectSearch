class CreateAdmins < ActiveRecord::Migration[4.2]
  def change
    create_table :admins do |t|
      t.string :full_name
      t.string :email
      t.string :tel
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
