class RemoveClubFromMatches < ActiveRecord::Migration[6.1]
  def change
    remove_column :matches, :club_id
  end
end
