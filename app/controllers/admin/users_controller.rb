class Admin::UsersController < Admin::BaseController
  before_action :check_if_user_exists, only: %i[show edit update destroy]

  def index
    @users = User.paginate(page: params[:page], per_page: 10)
  end

  def show
    # @user is defined in check_if_user_exists method
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
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
    if @user.update(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    flash[:success] = "User deleted"
    redirect_to users_url
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
    @user = User.find(params[:id])
  end

end
