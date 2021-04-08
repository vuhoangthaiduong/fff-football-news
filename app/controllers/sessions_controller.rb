class SessionsController < ApplicationController
  def new
    if is_logged_in?
      flash[:info] =  'You are already logged in'
      redirect_to root_path
    else
      render 'new'
    end
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      remember user
      flash[:success] =  'Welcome back'
      redirect_to user
    else
      flash.now[:danger] =  'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out if is_logged_in?
    redirect_to root_url
  end
end
