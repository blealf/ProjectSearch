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
  # when staff is removed, their projects are removed also
  has_many :projects, dependent: :destroy

  # each staff belongs to a department
  belongs_to :department

  # students can suggest several projects to a staff.
  has_many :project_suggestions

  # students apply to several projects of staff.
  has_many :project_applications
  has_many :students, through: :project_applications
  #has_many :projects, through: :project_applications

  # a staff can have one or more students allocated to them to supervise
  has_many :allocations

  has_many :archives

  #validations
  #before commiting to database change the email to lower case
  #before_save { email.downcase! }
  before_save { pnumber.downcase! }

  # ensure presence of first name, last name and email
  # and also validates the length of each
  validates :department_id, presence: true
  validates :first_name, presence:  true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }
  validates :pnumber, presence: true, length: { maximum: 10 }, format: { without: /\s/, message: "cannot contain white spaces" }, uniqueness: { case_sensitive: false }
  validates :office_tel, format: { without: /\s/ } 
  validates :profile, :format => URI::regexp(%w(http https)), :allow_blank => true

	#validates :password, length: { minimum: 6 }

	#uses the bcrypt ruby gem for secure password hashing
	has_secure_password

  # validates the presence and lenght of the password and 
  # verified that it is consistent with the password confirmation
  # during creation
  if :password.empty?
    validates :password, presence: true, length: { minimum: 6 }
    validates_confirmation_of :password
  end


  VALID_EMAIL_CHARACTERS = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_CHARACTERS }, uniqueness: { case_sensitive: false }

  # from railstutorial.org/book Chapter 9.
  # https://www.railstutorial.org/book/advanced_login
  # Returns the hash digest of the given string.
  # def self.digest(string)
  #   cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
  #                                                 BCrypt::Engine.cost
  #   BCrypt::Password.create(string, cost: cost)
  # end

  # # Creates a random token.
  # def self.new_token
  #   SecureRandom.urlsafe_base64
  # end

  # #Uses the created token as the remember_token for the staff and stores it in the database
  # def remember
  #   self.remember_token = Staff.new_token
  #   update_attribute(:remember_digest, Staff.digest(remember_token))
  # end

  #   # Returns true if the given token matches the digest.
  # def authenticated?(remember_token)
  #   return false if remember_digest.nil?
  #   BCrypt::Password.new(remember_digest).is_password?(remember_token)
  # end

  # # Forgets a user.
  # def forget
  #   update_attribute(:remember_digest, nil)
  # end

end
