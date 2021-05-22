class Match < ApplicationRecord
  belongs_to :season
  belongs_to :first_team, class_name: "Club"
  belongs_to :second_team, class_name: "Club"
  has_many :match_events, class_name: "MatchEvent", dependent: :destroy

  # validates :start_at, presence: true
  # validates :end_at, presence: true

end
    