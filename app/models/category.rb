#
# The Category Class is the model interfaces directly with the database table categories
# This communicates with the categories controller which renders the view
#
# The associations with other models are defined in this class
# it also handles validation of the fields
#

class Category < ActiveRecord::Base

	#attr_accessor :category_name

	# models the associations
	# a category has many projects
	has_many :projects

	# validates the presence of category_name
	validates :category_name, presence: true

end
