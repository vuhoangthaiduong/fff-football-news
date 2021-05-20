class Match < ApplicationRecord
  belongs_to :season
  belongs_to :first_team, class_name: "Club"
  belongs_to :second_team, class_name: "Club"

  # validates :start_at, presence: true
  # validates :end_at, presence: true

end
    