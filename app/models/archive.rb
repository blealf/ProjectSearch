class Archive < ActiveRecord::Base
  belongs_to :staff
  belongs_to :project_application
end
