class AddStudentRefToFeedbacks < ActiveRecord::Migration[4.2]
  def change
    add_reference :feedbacks, :student, index: true, foreign_key: true
  end
end
