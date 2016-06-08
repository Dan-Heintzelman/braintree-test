class ChargesController < ApplicationController
  include SessionHelper

  def new
    @total_cost = current_user.cart_total
    @token = Braintree::ClientToken.generate
  end

  def create
    @total_cost = current_user.cart_total
    nonce = params[:payment_method_nonce]
    puts "@@@@@@@@@@@@@@@@"
    puts nonce
    result = Braintree::Transaction.sale(
      amount: "#{@total_cost}",
      payment_method_nonce: nonce,
      options: {
        submit_for_settlement: true
      }
    )
    if result.success?
      redirect_to complete_charge_path(result: "Success")
    else
      redirect_to complete_charge_path
    end
  end

  def complete
    result = params[:result]
    puts "COMPLETE ROUTE *************"
    puts result
    if result == "Success"
      current_user.selecteditems.destroy_all
    else
      @error = "Transaction failed :("
    end
  end



end
