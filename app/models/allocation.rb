class Allocation < ActiveRecord::Base
  belongs_to :student
  belongs_to :staff
  belongs_to :supervision_type

  # validates presence of the student, staff and allocation type
  # and a unique combination of staff and student pair
  validates :student_id, :staff_id, :supervision_type, presence: :true
  validates_uniqueness_of :student_id, :scope => :staff_id
  
end
