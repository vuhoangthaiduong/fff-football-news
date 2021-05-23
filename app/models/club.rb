class Club < ApplicationRecord
  has_many :players, dependent: :nullify
  has_many :as_first_team_matches, class_name: "Match", foreign_key: "first_team_id", dependent: :destroy #dependent: :nullify is a major in the ass
  has_many :as_second_team_matches, class_name: "Match", foreign_key: "second_team_id", dependent: :destroy
  has_many :incoming_transfers, class_name: "TransferHistory", foreign_key: "from_club_id", dependent: :destroy
  has_many :outcoming_transfers, class_name: "TransferHistory", foreign_key: "to_club_id", dependent: :destroy
  has_one_attached :logo
  default_scope { order(name: :asc) }
  validates :name, presence: true, length: { maximum: 50 }

  def matches
    Match.where("first_team_id = ? OR second_team_id = ?", self.id, self.id)
  end 

end
  