class Player < ApplicationRecord
  belongs_to :club
  belongs_to :nationality
  belongs_to :position
  has_many :transfer_histories, dependent: :destroy
  has_many :matches, through: :matches_players
  has_one_attached :picture

  validates :name, presence: true, length: { maximum: 50 }

end
    