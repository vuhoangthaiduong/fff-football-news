class Season < ApplicationRecord
  has_many :matches
  has_many :standings
end
        