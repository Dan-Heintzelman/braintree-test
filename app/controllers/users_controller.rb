class UsersController < ApplicationController
  include SessionHelper

  def display_cart # Should I even include user ID in route? R
    @cart = current_user.build_cart
  end

end
