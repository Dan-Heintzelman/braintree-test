class SessionsController < ApplicationController

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      log_in_user(@user)
      redirect_to root_url
    else
      @errors = @user.errors.full_messages
      render "new"
    end
  end

  def destroy
    log_out_user
    redirect_to root_url
  end

  def log_in_user(user)
    session[:user_id] = user.id
  end

  def log_out_user
    session.delete(:user_id)
  end

end
