class ApplicationController < ActionController::Base
  include SessionsHelper

  def check_if_user_exists
    if !User.exists?(params[:id])
      flash[:info] = "User not found"
      redirect_to root_path
    end
    @user = User.find(params[:id])
  end

end
