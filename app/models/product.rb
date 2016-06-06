class Product < ActiveRecord::Base
  has_many :selecteditems
  has_many :users, through: :selecteditems

  def price_in_dollars
    self.price.to_f / 100
  end

end
