class User < ActiveRecord::Base
  has_many :carts
  has_many :products, through: :carts

  has_secure_password

  validates_uniqueness_of :email

end
