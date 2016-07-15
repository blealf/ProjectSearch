#
# The Interest Class is the model interfaces directly with the database table interests
# This communicates with the interests controller which renders the view
#
# The associations with other models are defined in this class
# it also handles validation of the fields
# 
class Interest < ActiveRecord::Base

		# validates the presence of interest_name
	validates :interest_name, presence: true
end
