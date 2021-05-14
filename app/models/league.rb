class League < ApplicationRecord
  has_many :seasons, dependent: :destroy
  has_one_attached :logo

  validates :name, presence: true, length: { maximum: 50 }

end
      