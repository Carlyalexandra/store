class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :card
  has_many :orders_products
  has_many :products, through: :orders_products
end
