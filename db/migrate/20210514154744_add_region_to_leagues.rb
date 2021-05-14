class AddRegionToLeagues < ActiveRecord::Migration[6.1]
  def change
    add_column :leagues, :region, :text
  end
end
