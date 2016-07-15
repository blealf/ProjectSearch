class CreateJoinTableProjectCourse < ActiveRecord::Migration
  def change
    create_join_table :projects, :courses do |t|
    	#t.references :project
    	#t.references :course
       	t.index [:project_id, :course_id]
      # t.index [:course_id, :project_id]
    end
  end
end
