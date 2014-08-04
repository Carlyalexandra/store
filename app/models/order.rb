class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :card
  has_many :orders_products
  has_many :products, through: :orders_products

	
	validates_presence_of :face

  

def subtotals
  self.orders_products.map {|i| i.subtotal}
end
 
def total
  subtotals.sum
end

end
