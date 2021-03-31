class AddSeasonModel < ActiveRecord::Migration[6.1]
  def change
    # Seasons table
    create_table :seasons do |t|
      t.date :start_at
      t.date :end_at
      t.timestamps
    end

    # Add FKs for Seasons table
    add_reference :seasons, :league, index: true
    add_foreign_key :seasons, :leagues
  end
end
