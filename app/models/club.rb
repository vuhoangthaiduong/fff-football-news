class Club < ApplicationRecord
  has_many :players, dependent: :destroy
  has_many :matches, dependent: :destroy
end
  