class Admin::TransferHistoriesController < Admin::BaseController
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

  def destroy
    @transfer_history= TransferHistory.find(params[:id])
    player = @transfer_history.player
    @transfer_history.destroy
    flash[:success] = "Transfer history deleted"
    redirect_to admin_player_path(player)
  end
  
end
