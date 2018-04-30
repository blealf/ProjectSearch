class AddNoteToApplicationreplies < ActiveRecord::Migration[4.2]
  def change
    add_column :applicationreplies, :note, :string
  end
end
