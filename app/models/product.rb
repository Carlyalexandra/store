class Product < ActiveRecord::Base
	has_many :orders_products
	has_many :orders, through: :orders_products

	def previous
	  Product.find_by_id(id - 1)
	end

	def next
	  Product.find_by_id(id + 1)
	end

end
