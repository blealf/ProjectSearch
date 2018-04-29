class Level < ActiveRecord::Base

	# Each level has many projects and many students
	has_many :projects
	has_many :students

	# validates the presence of level_name
	validates :level_name, presence: true
end
