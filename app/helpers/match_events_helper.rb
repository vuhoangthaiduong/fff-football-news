module MatchEventsHelper
	
	def get_match_event_text(match_event)
		event_type = match_event.event_type
		text = ""

		case event_type
		when 1
			text = "#{Player.find(match_event.subject_player_id).name} (#{Club.find(match_event.subject_team_id).name}) scored 1 points against #{Club.find(match_event.object_team_id).name}"
		when 2
			text = "#{Club.find(match_event.object_team_id).name} was awarded a penalty because #{Player.find(match_event.subject_player_id).name} (#{Club.find(match_event.subject_team_id).name}) commited an offence"
		when 3
			text = "#{Player.find(match_event.subject_player_id).name} (#{Club.find(match_event.subject_team_id).name}) was given a yellow card"
		when 4
			text = "#{Player.find(match_event.subject_player_id).name} (#{Club.find(match_event.subject_team_id).name}) was given a red card"
		when 5
			text = "#{Player.find(match_event.subject_player_id).name} (#{Club.find(match_event.subject_team_id).name}) was substituted with #{Player.find(match_event.object_player_id).name}"
		else
			text = "Case unknown"
		end
		return text
	end

end
