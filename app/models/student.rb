#
# The Student Class is the model interfaces directly with the database table students
# This communicates with the students controller which renders the view
#
# The associations with other models are defined in this class
# it also handles validation of the fields
# 
class Student < ActiveRecord::Base

	# validates the presence of the full_name and email fields during creation
	# also validates the length
	validates :full_name, presence:  true, length: { maximum: 60 }
  	validates :email, presence: true, length: { maximum: 255 }

	#this uses the bcrypt ruby gem for secure password hashing
	has_secure_password

	#validates the presence and lenght of the password and 
	# verified that it is consistent with the password confirmation
	# during creation
	validates :password, presence: true, length: { minimum: 6 }
	validates_confirmation_of :password
end
