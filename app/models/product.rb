class Product < ActiveRecord::Base
  attr_accessor :multiplier

  has_many :selecteditems
  has_many :users, through: :selecteditems

  
  # def price_in_dollars
  #   self.price.to_f / 100
  # end

end
