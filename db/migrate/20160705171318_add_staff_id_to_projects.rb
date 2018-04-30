class AddStaffIdToProjects < ActiveRecord::Migration[4.2]
  def change
    add_reference :projects, :staff, index: true, foreign_key: true
  end
end
