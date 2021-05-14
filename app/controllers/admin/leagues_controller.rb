class Admin::LeaguesController < Admin::BaseController
  before_action :check_if_league_exists, only: %i[show edit update destroy]
  before_action :check_if_user_is_admin, only: %i[new edit create update destroy]

  def index
    @leagues = League.all.page(params[:page]).per(10)
  end

  def show
    # @league is defined in check_if_league_exists method
  end

  def new
    @league = League.new()
  end

  def edit
    # @league is defined in check_if_league_exists method
    @season = @league.seasons.build()
  end

  def create
    @league = League.new(league_params)
    @league.logo.attach(params[:league][:logo])
    if @league.save
      flash[:success] = "League created!"
      redirect_to admin_leagues_path
    else
      render 'new'
    end
  end

  def update 
    if @league.update(league_params)
      if params[:league][:logo].nil? || (!params[:league][:logo].nil? && @league.logo.attach(params[:league][:logo]))
        flash[:success] = "League updated"
        redirect_to admin_league_path(@league)
      else
        render 'edit'
      end
    else
      render 'edit'
    end
  end

  def destroy
    @league.destroy
    flash[:success] = "League deleted"
    redirect_to admin_leagues_path
  end

  private

    def league_params
      params.require(:league).permit(:name, :website_url, :venue, :founder, :founded_at)
    end

    def check_if_league_exists
      if !League.exists?(params[:id])
        flash[:info] = "League not found"
        redirect_to admin_leagues_path
      end
      @league = League.find(params[:id])
    end
    
end
