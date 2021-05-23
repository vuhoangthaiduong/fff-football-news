class Match < ApplicationRecord
  belongs_to :season
  belongs_to :first_team, class_name: "Club", foreign_key: "first_team_id"
  belongs_to :second_team, class_name: "Club", foreign_key: "second_team_id"
  has_many :match_events, class_name: "MatchEvent", dependent: :destroy

  # validates :start_at, presence: true
  # validates :end_at, presence: true

end
    