class Product < ActiveRecord::Base
  has_many :carts
  has_many :users, through: :carts
  validates :name, presence: true
  validates :price, numericality: true
end
