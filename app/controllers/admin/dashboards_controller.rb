class Admin::DashboardsController < Admin::BaseController

  def index
    redirect_to admin_dashboard_path
  end

  def dashboard
    @user_count = User.count
  end

end
