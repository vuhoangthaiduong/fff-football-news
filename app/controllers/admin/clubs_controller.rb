class Admin::ClubsController < Admin::BaseController
  before_action :check_if_club_exists, only: %i[show edit update destroy]
  before_action :check_if_user_is_admin, only: %i[new edit create update destroy]

  def index
    @clubs = Club.all.page(params[:page]).per(10)
  end

  def show
    # @club is defined in check_if_club_exists method
  end

  def new
    @club = Club.new()
  end

  def edit
    # @club is defined in check_if_club_exists method
  end

  def create
    @club = Club.new(club_params)
    @club.logo.attach(params[:club][:logo])
    if @club.save
      flash[:success] = "Club created!"
      redirect_to admin_clubs_path
    else
      render 'new'
    end
  end

  def update 
    if @club.update(club_params)
      if params[:club][:logo].nil? || (!params[:club][:logo].nil? && @club.logo.attach(params[:club][:logo]))
        flash[:success] = "Club updated"
        redirect_to admin_club_path(@club)
      else
        render 'edit'
      end
    else
      render 'edit'
    end
  end

  def destroy
    @club.destroy
    flash[:success] = "Club deleted"
    redirect_to admin_clubs_path
  end

  private

    def club_params
      params.require(:club).permit(:name, :stadium, :history, :manager, :founded_at)
    end

    def check_if_club_exists
      if !Club.exists?(params[:id])
        flash[:info] = "Club not found"
        redirect_to admin_clubs_path
      end
      @club = Club.find(params[:id])
    end
    
end
