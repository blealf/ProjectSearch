class Suggestionreply < ActiveRecord::Base
  belongs_to :project_suggestion, dependent: :destroy
end
