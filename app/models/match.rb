class Match < ApplicationRecord
  belongs_to :club, dependent: :destroy
  belongs_to :season, dependent: :destroy
  has_many :matches, through: :matches_players

  validates :start_at, presence: true
  validates :end_at, presence: true
  validates :stage_in_league, presence: true
  validates :judge_name, presence: true
  validates :first_team_id, presence: true
  validates :second_team_id, presence: true
  validates :end_at, presence: true


  t.string "stage_in_league"
  t.string "judge_name"
  t.integer "first_team_goal_count"
  t.integer "second_team_goal_count"
  t.string "match_event"
  t.integer "first_team_id"
  t.integer "second_team_id"

end
    