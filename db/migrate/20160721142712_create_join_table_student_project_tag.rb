class CreateJoinTableStudentProjectTag < ActiveRecord::Migration
  def change
    create_join_table :students, :project_tags do |t|
      # t.index [:student_id, :project_tag_id]
      # t.index [:project_tag_id, :student_id]
    end
  end
end
