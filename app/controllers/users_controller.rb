class UsersController < ApplicationController
  include SessionHelper

  def display_cart # Should I even include user ID in route?
    @cart = current_user.build_cart
    @total_cost = current_user.cart_total
  end

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in_user(@user)
      redirect_to root_url
    else
      @errors = @user.errors.full_messages
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    user_path(@user)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      redirect_to @user
    else
      render 'edit'
    end
  end

  #Refactor to destroy individual cart items
  def destroy
    current_user.selecteditems.destroy_all
    redirect_to display_cart_user_path(current_user.id)
  end

  private
      def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password)
      end

      def log_in_user(user)
        session[:user_id] = user.id
      end

end
