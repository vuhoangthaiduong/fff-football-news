class Player < ApplicationRecord
  has_many :transfer_history, dependent: :destroy
  has_many :matches, through: :matches_players

  validates :name, presence: true, length: { maximum: 50 }

end
    