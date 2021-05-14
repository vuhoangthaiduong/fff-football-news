class AddFkToMatches < ActiveRecord::Migration[6.1]
  def change
    # Add FKs for Seasons table
    add_reference :matches, :club, index: true
    add_foreign_key :matches, :clubs
  end
end
