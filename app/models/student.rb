#
# The Student Class is the model interfaces directly with the database table students
# This communicates with the students controller which renders the view
#
# The associations with other models are defined in this class
# it also handles validation of the fields
# 
class Student < ActiveRecord::Base

	# set and get for remeber_token
  	attr_accessor :remember_token
  	
	# each student belongs to course
	belongs_to :course

	# each student has many project suggestions
	# which exist as long as their profile exists
	has_many :project_suggestions, dependent: :destroy

	# each student has many project_tags (as interests) and vice-versa
	has_and_belongs_to_many :project_tags

	# each student belongs to level
	belongs_to :level

	# each student has many shortlists
	# each student has many projects only through shortlists.
	has_many :shortlists, dependent: :destroy
	has_many :projects, through: :shortlists

	# each student can have several project application
	has_many :project_applications, dependent: :destroy
	has_many :staffs, through: :project_applications

  	# a student makes feedbacks
  	has_many :feedbacks, dependent: :destroy

  	# a student can have one or more supervisors (staff) allocated tothem
  	has_many :allocations
  	
	#validations
  	#before commiting to database change the email to lower case
  	before_save { email.downcase! }
  	#before_save { pnumber.downcase! }

	# validates the presence of the full_name, pnumber course_id and email fields during creation
	# also validates the length
	validates :full_name, presence:  true, length: { maximum: 60 }
	validates  :pnumber, presence: true, :uniqueness => true, :case_sensitive => false, length: { maximum: 10 }
  	validates :email, presence: true, length: { maximum: 255 }
  	validates :course_id, presence: true

	#this uses the bcrypt ruby gem for secure password hashing
	has_secure_password

	#validates the presence and lenght of the password and 
	# verified that it is consistent with the password confirmation
	# during creation
	if :password.empty?
		validates :password, presence: true, length: { minimum: 6 }
		validates_confirmation_of :password
	end

	# def Student.digest(string)
	#     cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
	#                                                   BCrypt::Engine.cost
	#     BCrypt::Password.create(string, cost: cost)
	#   end

	#   # Creates a random token.
	#   def Student.new_token
	#     SecureRandom.urlsafe_base64
	#   end

	#   #Uses the created token as the remember_token for the Student and stores it in the database
	#   def remember
	#     self.remember_token = Student.new_token
	#     update_attribute(:remember_digest, Student.digest(remember_token))
	#   end

	#     # Returns true if the given token matches the digest.
	#   def authenticated?(remember_token)
	#     return false if remember_digest.nil?
	#     BCrypt::Password.new(remember_digest).is_password?(remember_token)
	#   end

	#   # Forgets a user.
	#   def forget
	#     update_attribute(:remember_digest, nil)
	#   end


end
