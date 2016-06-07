class UsersController < ApplicationController
  include SessionHelper

  def display_cart # Should I even include user ID in route?
    @cart = current_user.build_cart
    @total_cost = current_user.cart_total
  end

end
