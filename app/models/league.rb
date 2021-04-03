class League < ApplicationRecord
  has_many :seasons

  validates :name, presence: true, length: { maximum: 50 }

end
      