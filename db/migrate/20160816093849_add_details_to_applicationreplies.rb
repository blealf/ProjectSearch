class AddDetailsToApplicationreplies < ActiveRecord::Migration
  def change
    add_column :applicationreplies, :commenter, :string
  end
end
