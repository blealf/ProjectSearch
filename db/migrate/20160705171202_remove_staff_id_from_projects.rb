class RemoveStaffIdFromProjects < ActiveRecord::Migration
  def change
    remove_column :projects, :staff_id, :integer
  end
end
