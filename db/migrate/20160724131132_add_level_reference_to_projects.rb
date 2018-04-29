class AddLevelReferenceToProjects < ActiveRecord::Migration
  def change
    add_reference :projects, :level, index: true, foreign_key: true
  end
end
