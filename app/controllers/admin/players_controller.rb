class Admin::PlayersController < Admin::BaseController
  before_action :check_if_player_exists, only: %i[show edit update destroy]
  before_action :check_if_user_is_admin, only: %i[new edit create update destroy]

  def index
    @players = Player.all.page(params[:page]).per(10)
  end

  def show
    # @player is defined in check_if_player_exists method
  end

  def new
    @player = Player.new()
    @positions = Position.all()
    @nationalities = Nationality.all()
  end

  def edit
    # @player is defined in check_if_player_exists method
  end

  def create
    @player = Player.new(player_params)
    @player.picture.attach(params[:player][:picture])
    if @player.save
      flash[:success] = "Player created!"
      redirect_to admin_players_path
    else
      render 'new'
    end
  end

  def update 
    if @player.update(player_params)
      if params[:player][:picture].nil? || (!params[:player][:picture].nil? && @player.picture.attach(params[:player][:picture]))
        flash[:success] = "Player updated"
        redirect_to admin_player_path(@player)
      else
        render 'edit'
      end
    else
      render 'edit'
    end
  end

  def destroy
    @player.destroy
    flash[:success] = "Player deleted"
    redirect_to admin_players_path
  end

  private

    def player_params
      params.require(:player).permit(:name, :dob, :nationality_id, :club_id, :position_id)
    end

    def check_if_player_exists
      if !Player.exists?(params[:id])
        flash[:info] = "Player not found"
        redirect_to admin_players_path
      end
      @player = Player.find(params[:id])
    end
    
end
