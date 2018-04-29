# This handles the reply to project applications
class Applicationreply < ActiveRecord::Base
  belongs_to :project_application
end
