class Admin::SeasonsController < Admin::BaseController
  before_action :check_if_season_exists, only: %i[update destroy]
  before_action :check_if_user_is_admin, only: %i[create update destroy]

  def index
    redirect_to admin_leagues_path
  end

  def show
    redirect_to admin_leagues_path
  end

  def new
    league = League.find_by(id: params[:league_id])
    @season = league.seasons.new()

    respond_to do |format|
      format.html # new.html.erb
      format.js # new.js.erb
    end

  end

  def create
    league = League.find_by(id: params[:league_id])
    @season = league.seasons.build(season_params)
    if @season.save
      flash[:success] = "Season created!"
      redirect_to admin_league_path(league)
    else
      flash[:error] = "Something went wrong!"
    end
  end

  def update 
    if @season.update(season_params)
      flash[:success] = "Season updated"
      redirect_to admin_season_path(@season)
    else
      flash[:error] = "Something went wrong!"
    end
  end

  def destroy
    league = @season.league
    @season.destroy
    flash[:success] = "Season deleted"
    # respond_to do |format|
    #   format.js # destroy.js.erb
    # end
    redirect_to admin_league_path(league)
  end

  private

    def season_params
      params.require(:season).permit(:start_at, :end_at)
    end

    def check_if_season_exists
      if !Season.exists?(params[:id])
        flash[:info] = "Season not found"
      end
      @season = Season.find(params[:id])
    end
    
end
