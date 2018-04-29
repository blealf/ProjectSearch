class ProjectSuggestion < ActiveRecord::Base

	# A project suggestion belongs to a student
	belongs_to :student
	#project suggestion is suggested to a staff
	belongs_to :staff

	# has replies. Should the suggestion be deleted, the replies also will.
	has_many :suggestionreplies, dependent: :destroy

	# validates the presence of title and description
	validates :title, :description, :staff_id, presence: true
end
