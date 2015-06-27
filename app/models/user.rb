class User < ActiveRecord::Base
  has_secure_password
	has_many :orders
	has_many :products, through: :orders
	validates_presence_of :email, :password, :password_confirmation
end
