class Product < ActiveRecord::Base
  has_many :selecteditems
  has_many :users, through: :selecteditems

end
