class AddNoteToApplicationreplies < ActiveRecord::Migration
  def change
    add_column :applicationreplies, :note, :string
  end
end
