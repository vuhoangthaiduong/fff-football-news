class Match < ApplicationRecord
  belongs_to :club, dependent: :destroy
  belongs_to :season, dependent: :destroy
  has_many :matches, through: :matches_players

  validates :start_at, presence: true
  validates :end_at, presence: true

end
    