class OrdersProduct < ActiveRecord::Base
  belongs_to :product
  belongs_to :order

  def subtotal
  	self.product.price * self.quantity
  end
end
