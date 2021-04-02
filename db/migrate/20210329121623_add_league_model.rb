class AddLeagueModel < ActiveRecord::Migration[6.1]
  def change
    # Leagues table
    create_table :leagues do |t|
      t.string :name
      t.string :website_url
      t.timestamps
    end
  end
end
