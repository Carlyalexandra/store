class User < ActiveRecord::Base
	validates_presence_of :email
	validates :email, uniqueness: true
	
	has_many :orders
	has_many :cards
	has_many :products, through: :products_orders

	 def lastfour(number)
  	number.to_s.length <= 4 ? number : number.to_s.slice(-4..-1)
  end

  def mask(number)
  	"XXXX-XXXX-XXXX-#{lastfour(number)}"
  end
end
