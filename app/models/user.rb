class User < ActiveRecord::Base
  has_many :selecteditems
  has_many :products, through: :selecteditems
  

  validates_presence_of :email, :password_digest
  validates_uniqueness_of :email


end
