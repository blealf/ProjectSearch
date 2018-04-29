class AddStudentRefToFeedbacks < ActiveRecord::Migration
  def change
    add_reference :feedbacks, :student, index: true, foreign_key: true
  end
end
