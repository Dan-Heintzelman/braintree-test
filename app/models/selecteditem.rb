class Selecteditem < ActiveRecord::Base
  belongs_to :user
  belongs_to :product


  # def total_cost
  #   @items = current_user.find
  #
  # end


end
