class TransferHistory < ApplicationRecord
  belongs_to :player

  validates :from_club_id, presence: true
  validates :to_club_id, presence: true

end
    