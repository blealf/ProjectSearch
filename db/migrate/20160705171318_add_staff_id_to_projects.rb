class AddStaffIdToProjects < ActiveRecord::Migration
  def change
    add_reference :projects, :staff, index: true, foreign_key: true
  end
end
