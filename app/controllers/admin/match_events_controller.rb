class Admin::MatchEventsController < Admin::BaseController
  before_action :check_if_match_event_exists, only: %i[edit update destroy]
  before_action :check_if_user_is_admin, only: %i[create update destroy]

  def index
    redirect_to admin_matchs_path
  end

  def show
    #@match_event is defined at check_if_match_event_exists
    redirect_to admin_matchs_path
  end

  def new
    match = Match.find_by(id: params[:match_id])
    @match_event = match.match_events.new()

    respond_to do |format|
      format.html # new.html.erb
      format.js # new.js.erb
    end

  end

  def edit
    #@match_event is defined at check_if_match_event_exists
    respond_to do |format|
      format.js # edit.js.erb
    end

  end

  def create
    match = Match.find_by(id: params[:match_id])
    @match_event = match.match_events.build(match_event_params)
    if check_if_fields_are_valid && @match_event.save
      flash[:success] = "Match event created!"
      redirect_to admin_match_path(match)
    else
      redirect_to admin_match_path(match)
      flash[:error] = "Something went wrong!"
    end
  end

  def update 
    if check_if_fields_are_valid && @match_event.update(match_event_params)
      flash[:success] = "Match event updated"
      redirect_to admin_match_event_path(@match_event)
    else
      redirect_to admin_match_path(match)
      flash[:error] = "Something went wrong!"
    end
  end

  def destroy
    match = @match_event.match
    @match_event.destroy
    flash[:success] = "Match event deleted"
    # respond_to do |format|
    #   format.js # destroy.js.erb
    # end
    redirect_to admin_match_path(match)
  end

  private

    def match_event_params
      params.require(:match_event).permit(:happened_at,
                                          :subject_player_id,
                                          :object_player_id,
                                          :subject_team_id,
                                          :object_team_id,
                                          :event_type)
    end

    def check_if_match_event_exists
      if !MatchEvent.exists?(params[:id])
        flash[:info] = "Match event not found"
      end
      @match_event = MatchEvent.find(params[:id])
    end
    
    def check_if_fields_are_valid
      happened_at = params[:match_event][:happened_at]
      return false if happened_at.blank?
      subject_player_id = params[:match_event][:subject_player_id]
      object_player_id = params[:match_event][:object_player_id]
      subject_team_id = params[:match_event][:subject_team_id]
      object_team_id = params[:match_event][:object_team_id]
      event_type = params[:match_event][:event_type]

      case params[:match_event][:event_type]
      when "1", "2"
        return false if subject_player_id.blank? || subject_team_id.blank? || object_team_id.blank?
      when "3", "4"
        return false if subject_player_id.blank? || object_player_id.blank? || subject_team_id.blank? || object_team_id.blank?
      when "5"
        return false if subject_player_id.blank? || object_player_id.blank? || subject_team_id.blank?
      else
        return false
      end
      return true
    end
    
end
