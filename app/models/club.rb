class Club < ApplicationRecord
  has_many :players
  has_many :matches, dependent: :destroy
  has_one_attached :logo

  validates :name, presence: true, length: { maximum: 50 }

end
  