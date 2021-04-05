class Standing < ApplicationRecord
  belongs_to :season

  validates :group, presence: true

end
          