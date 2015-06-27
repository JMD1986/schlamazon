class User < ActiveRecord::Base
	has_many :orders
	has_many :products, through: :orders
  has_secure_password
	validates_presence_of :name, :email, :password, :password_confirmation
end
