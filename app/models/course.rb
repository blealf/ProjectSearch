#
# The Course Class is the model interfaces directly with the database table courses
# This communicates with the courses controller which renders the view
#
# The associations with other models are defined in this class
# it also handles validation of the fields
#

class Course < ActiveRecord::Base

	# models the association
	# a course has many projects and vice versa
	has_and_belongs_to_many :projects

	# validates the presence of course_name
	validates :course_name, presence: true
end
