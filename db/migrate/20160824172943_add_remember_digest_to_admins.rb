class AddRememberDigestToAdmins < ActiveRecord::Migration[4.2]
  def change
    add_column :admins, :remember_digest, :string
  end
end
