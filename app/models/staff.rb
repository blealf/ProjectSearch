#
# The Staff Class is the model interfaces directly with the database table staffs
# This communicates with the staffs controller which renders the view
#
# The associations with other models are defined in this class
# it also handles validation of the fields
# 
class Staff < ActiveRecord::Base


  # set and get for remeber_token
  attr_accessor :remember_token

  #relationships
  #cascade the parent and child entities
  has_many :projects, dependent: :destroy

  #validations
  #before commiting to database change the email to lower case
  before_save { email.downcase! }

  # ensure presence of first name, last name and email
  # and also validates the length of each
  validates :first_name, presence:  true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 }

	#validates :password, length: { minimum: 6 }

	#uses the bcrypt ruby gem for secure password hashing
	has_secure_password

  # validates the presence and lenght of the password and 
  # verified that it is consistent with the password confirmation
  # during creation
	validates :password, presence: true, length: { minimum: 6 }
	validates_confirmation_of :password


	#Validates email for login purpose. But will not work if a staff has multiple email addresses 
  #(NEEDS REFACTORING!!!)
  	
    # VALID_EMAIL_CHARACTERS = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  	# validates :email, presence: true, length: { maximum: 255 },
   #                  format: { with: VALID_EMAIL_CHARACTERS },
   #                  uniqueness: { case_sensitive: false }

  #    # Returns the hash digest of the given string.
  # def staff.digest(string)
  #   cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
  #                                                 BCrypt::Engine.cost
  #   BCrypt::Password.create(string, cost: cost)
  # end


  # class << self
  # # Returns the hash digest of the given string.
  # def digest(string)
  #   cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
  #                                                 BCrypt::Engine.cost
  #   BCrypt::Password.create(string, cost: cost)
  # end

    
  # Creates a random token.
  def Staff.new_token
    SecureRandom.urlsafe_base64
  end

  #Uses the created token as the remember_token for the staff and stores it in the database
  def remember
    self.remember_token = Staff.new_token
    update_attribute(:remember_digest, Staff.digest(remember_token))
  end

end
