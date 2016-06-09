class ChargesController < ApplicationController
  include SessionHelper

  def new
    @total_cost = current_user.cart_total
    @token = Braintree::ClientToken.generate
    if current_user.customer_id
      render 'repeat'
    else
      render 'new'
    end
  end

  def create
    @total_cost = current_user.cart_total
    nonce = params[:payment_method_nonce]

    # If payment was method was submitted, create a customer
    # Future refactor: add ability to create add. payment methods
    if nonce
      customer_result = Braintree::Customer.create(
        first_name: current_user.first_name,
        last_name: current_user.last_name,
        payment_method_nonce: nonce
      )
      # If customer/method are submitted without error, store customer ID for repeat payments
      if customer_result.success?
        puts customer_result.customer
        current_user.update(customer_id: customer_result.customer.id)
      else
        @errors = customer_result.errors
        render 'new'
      end
    end
    # Either customer ID was just created or it already existed. Now we can process transaction.
    customer_id = current_user.customer_id
    result = Braintree::Transaction.sale(
    customer_id: customer_id,
    amount: "#{@total_cost}",
      options: {
        submit_for_settlement: true
      }
    )
    puts result
    if result.success?
      redirect_to complete_charge_path(result: "Success")
    else
      redirect_to complete_charge_path
    end
  end

  def complete
    result = params[:result]
    if result == "Success"
      current_user.selecteditems.destroy_all
    else
      @error = "Transaction failed :("
    end
  end





end
