class Feedback < ActiveRecord::Base

	# a feedbackis from a student
	belongs_to :student

	# validates the presence of department_name
	validates :body, presence: true
end
