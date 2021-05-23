class Admin::TransferHistoriesController < Admin::BaseController
  before_action :check_if_transfer_history_exists, only: %i[edit update destroy]
  before_action :check_if_user_is_admin, only: %i[create update destroy]

  def index
    redirect_to admin_players_path
  end

  def show
    redirect_to admin_players_path
  end

  def new
    player = Player.find_by(id: params[:player_id])
    @transfer_history = player.transfer_histories.new()

    respond_to do |format|
      format.js # new.js.erb
    end

  end

  def create
    player = Player.find(params[:player_id])
    @transfer_history = player.transfer_histories.build(from_club_id: player.club_id, 
                                                        to_club_id: params[:transfer_history][:to_club_id],
                                                        date_of_transfer: params[:transfer_history][:date_of_transfer],
                                                        price: params[:transfer_history][:price])
    if @transfer_history.save && player.update(club_id: @transfer_history.to_club_id)
      flash.now[:success] = "Player transfer to #{player.club.name}!"
    end
    redirect_to admin_player_path(player)
  end

  def edit
    #@transfer_history is defined at check_if_transfer_history_exists
    respond_to do |format|
      format.js # edit.js.erb
    end

  end

  def update 
    if @transfer_history.update(transfer_history_params)
      flash[:success] = "Match event updated"
      redirect_to admin_player_path(@transfer_history.player)
    else
      redirect_to admin_player_path(@transfer_history.player)
      flash[:error] = "Something went wrong!"
    end
  end

  def destroy
    @transfer_history= TransferHistory.find(params[:id])
    player = @transfer_history.player
    @transfer_history.destroy
    flash[:success] = "Transfer history deleted"
    redirect_to admin_player_path(player)
  end

  private
    def transfer_history_params
      params.require(:transfer_history).permit(:date_of_transfer,
                                               :price,
                                               :from_club_id,
                                               :to_club_id,
                                               :player_id)
    end

    def check_if_transfer_history_exists
      if !TransferHistory.exists?(params[:id])
        flash[:info] = "Transfer history not found"
      end
      @transfer_history = TransferHistory.find(params[:id])
    end
  
end
