class Season < ApplicationRecord
  has_many :matches
  has_many :standings

  validates :start_at, presence: true
  validates :end_at, presence: true

end
