class Card < ActiveRecord::Base
  validates :card_number, length: {minimum: 15, maximum: 16}
  validates :card_number, numericality: true
  validates :security_code, length: {minimum: 3, maximum: 4}
  validates :security_code, numericality: true

  belongs_to :user

  def lastfour(number)
  	number.to_s.length <= 4 ? number : number.to_s.slice(-4..-1)
  end

  def mask(number)
  	"XXXX-XXXX-XXXX-#{lastfour(number)}"
  end

end

