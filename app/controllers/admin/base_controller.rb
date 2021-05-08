class Admin::BaseController < ApplicationController
  # include AdminHelper
  layout "admin"

  def check_if_user_is_admin
    redirect_to(root_url) unless current_user.is_admin?
  end    

end
