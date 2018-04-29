# This defines the modelfor students shorlists of projects
#
#
class Shortlist < ActiveRecord::Base

	# A shortlist belongs to projects and students
	belongs_to :student
	belongs_to :project
end
