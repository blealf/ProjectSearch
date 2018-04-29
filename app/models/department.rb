class Department < ActiveRecord::Base

	# a department has many courses
	has_many :courses

	# a department has many members of staff
	has_many :staffs

	# a department belongs to a faculty
	belongs_to :faculty

	# validates the presence of department_name
	validates :department_name, :faculty_id, presence: true
end
