class Faculty < ActiveRecord::Base

	# A faculty has several departments
	has_many :departments

	# Afaculty has many courses only through departments
	has_many :courses, through: :departments


	# validates the presence of department_name
	validates :faculty_name, presence: true
end
