class Admin::MatchesController < Admin::BaseController
  before_action :check_if_match_exists, only: %i[show edit update destroy]
  before_action :check_if_user_is_admin, only: %i[new edit create update destroy]

  def index
    @matches = Match.all.page(params[:page]).per(10)
  end

  def show
    # @match is defined in check_if_match_exists method
  end

  def new
    @match = Match.new()
  end

  def edit
    # @match is defined in check_if_match_exists method
  end

  def create
    @match = Match.new(match_params)
    if @match.save
      flash[:success] = "Match created!"
      redirect_to admin_matches_path
    else
      render 'new'
    end
  end

  def update 
    if @match.update(match_params)
        redirect_to admin_match_path(@match)
    else
      render 'edit'
    end
  end

  def destroy
    @match.destroy
    flash[:success] = "Match deleted"
    redirect_to admin_matches_path
  end

  private

    def match_params
      params.require(:match).permit(:start_at, :end_at, :judge_name, 
                                    :first_team_id, :second_team_id,
                                    :stage_in_league, :season_id)
    end

    def check_if_match_exists
      if !Match.exists?(params[:id])
        flash[:info] = "Match not found"
        redirect_to admin_matches_path
      end
      @match = Match.find(params[:id])
    end
    
end
