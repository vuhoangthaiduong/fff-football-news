class Match < ApplicationRecord
  belongs_to :club
  belongs_to :season
  # has_many :matches, through: :matches_players

  validates :start_at, presence: true
  validates :end_at, presence: true

end
    