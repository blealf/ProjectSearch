class ProjectApplication < ActiveRecord::Base

	# A project application belongs to projects and students
	#belongs_to :ProjectApplication
	belongs_to :student
	belongs_to :staff
	belongs_to :project

	has_many :archives

	# has replies. Should the application be deleted, the replies also will.
	has_many :applicationreplies, dependent: :destroy
end
