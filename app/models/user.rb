class User < ActiveRecord::Base
  has_many :selecteditems
  has_many :products, through: :selecteditems


  validates_presence_of :email, :password_digest
  validates_uniqueness_of :email

  has_secure_password

  def cart_total
    cost = self.products.inject(0) do |total, item|
          total + item.price
    end

    return cost
  end


end
