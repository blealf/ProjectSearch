class AddLevelReferenceToStudents < ActiveRecord::Migration
  def change
    add_reference :students, :level, index: true, foreign_key: true
  end
end
