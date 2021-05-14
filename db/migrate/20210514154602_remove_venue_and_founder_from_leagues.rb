class RemoveVenueAndFounderFromLeagues < ActiveRecord::Migration[6.1]
  def change
    remove_column :leagues, :venue, :string
    remove_column :leagues, :founder, :string
  end
end
