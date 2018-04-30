class AddLevelReferenceToStudents < ActiveRecord::Migration[4.2]
  def change
    add_reference :students, :level, index: true, foreign_key: true
  end
end
