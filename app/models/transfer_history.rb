class TransferHistory < ApplicationRecord
  belongs_to :player
  belongs_to :from_club, class_name: :Club
  belongs_to :to_club, class_name: :Club

  validates :from_club_id, presence: true
  validates :to_club_id, presence: true

end
    