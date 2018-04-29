class CreateJoinTableProjectProjectTag < ActiveRecord::Migration
  def change
    create_join_table :projects, :project_tags do |t|
      # t.index [:project_id, :project_tag_id]
      t.index [:project_tag_id, :project_id]
    end
  end
end
