class Admin < ActiveRecord::Base

  	# set and get for remeber_token
  	attr_accessor :remember_token
  	
	#validations
  	#before commiting to database change the email to lower case
  	before_save { email.downcase! }
  	#before_save { pnumber.downcase! }
  	
	# validates the presence of the full_name and email fields during creation
	# also validates the length
	validates :full_name, presence:  true, length: { maximum: 60 }
	validates :pnumber, presence: true, length: { maximum: 10 }, uniqueness: { case_sensitive: false }
  	validates :email, presence: true, length: { maximum: 255 }

	#this uses the bcrypt ruby gem for secure password hashing
	has_secure_password

	#validates the presence and lenght of the password and 
	# verified that it is consistent with the password confirmation
	# during creation
	if :password.empty?
		validates :password, presence: true, length: { minimum: 6 }
		validates_confirmation_of :password
	end

	# def Admin.digest(string)
	#     cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
	#                                                   BCrypt::Engine.cost
	#     BCrypt::Password.create(string, cost: cost)
	#   end

	#   # Creates a random token.
	#   def Admin.new_token
	#     SecureRandom.urlsafe_base64
	#   end

	#   #Uses the created token as the remember_token for the Admin and stores it in the database
	#   def remember
	#     self.remember_token = Admin.new_token
	#     update_attribute(:remember_digest, Admin.digest(remember_token))
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
