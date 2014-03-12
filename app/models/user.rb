class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:login]
  belongs_to :department
  has_many :activities
  has_many :programs
  has_many :projects

  
  # Virtual attribute for authenticating by either username or email
  # This is is addition to a real persisted field like 'username'
  attr_accessor :login


  def login=(login)
   @login = login
  end

  def login
   @login || self.username || self.email
  end

  def self.find_first_by_auth_conditions(warden_conditions)
   conditions = warden_conditions.dup
   if login = conditions.delete(:login)
    where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
   else
    where(conditions).first
   end
  end

  validates :username,
   :uniqueness => { :case_sensitive => false }

  def sector
   department.sector
  end


end
