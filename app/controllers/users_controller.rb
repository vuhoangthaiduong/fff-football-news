class UsersController < ApplicationController
  before_action :check_if_user_exists, only: %i[show]

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to FFN!"
      redirect_to @user
    else
      render 'new'
    end
  end
    
  private
  def user_params
    params.require(:user).permit(:username, :email, :password,
    :password_confirmation)
  end

  def check_if_user_exists
    if !User.exists?(params[:id])
      flash[:info] = "User not found"
      redirect_to root_path
    end
  end

end
