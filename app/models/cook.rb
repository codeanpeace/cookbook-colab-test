class Cook < ActiveRecord::Base
  attr_accessible :age, :bio, :first_name, :last_name, :email, :password, :password_confirmation

  has_secure_password

  validates :email, :uniqueness => true
end
