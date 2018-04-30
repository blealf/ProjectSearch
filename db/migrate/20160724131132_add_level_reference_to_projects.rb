class AddLevelReferenceToProjects < ActiveRecord::Migration[4.2]
  def change
    add_reference :projects, :level, index: true, foreign_key: true
  end
end
