class AddSeasonToMatches < ActiveRecord::Migration[6.1]
  def change
    add_reference :matches, :season, index: true
  end
end
