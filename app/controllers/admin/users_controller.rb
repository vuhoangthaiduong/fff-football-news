class Admin::UsersController < Admin::BaseController
  before_action :check_if_user_exists, only: %i[show edit update destroy]
  before_action :check_if_user_is_admin, only: :destroy

  def index
    @users = User.all.page(params[:page]).per(10)
  end

  def show
    # @user is defined in check_if_user_exists method

    respond_to do |format|
      format.html # show.html.erb
      format.js # show.js.erb
    end

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.profile_picture.attach(params[:users][:profile_picture])
    if @user.save
      log_in @user
      flash[:success] = "Welcome to FFN!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
  end

  def update 
    if @user.update(user_params) && @user.profile_picture.attach(params[:user][:profile_picture])
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    flash[:success] = "User deleted"
    redirect_to admin_users_url
  end
    
  private
  def user_params
    params.require(:user).permit(:username, :email, :password,
    :password_confirmation, :profile_picture)
  end

  def check_if_user_exists
    if !User.exists?(params[:id])
      flash[:info] = "User not found"
      redirect_to root_path
    end
    @user = User.find(params[:id])
  end

  def check_if_user_is_admin
    redirect_to(root_url) unless current_user.is_admin?
  end    

end
