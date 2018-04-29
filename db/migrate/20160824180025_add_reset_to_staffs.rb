class AddResetToStaffs < ActiveRecord::Migration
  def change
    add_column :staffs, :reset_digest, :string
    add_column :staffs, :reset_sent_at, :datetime
  end
end
