class Player < ApplicationRecord
  has_many :transfer_history, dependent: :destroy
  has_many :matches, through: :matches_players
end
    