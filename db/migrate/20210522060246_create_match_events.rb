class CreateMatchEvents < ActiveRecord::Migration[6.1]
  def change
    # drop_table :match_events
    create_table :match_events do |t|
      t.references :match
      t.references :subject_team
      t.references :object_team
      t.references :subject_player
      t.references :object_player
      t.datetime :happened_at
      t.integer :event_type
      t.timestamps
    end

    #Add FKs for Match Events table
    add_foreign_key :match_events, :matches, column: :match_id
    add_foreign_key :match_events, :clubs, column: :object_team_id
    add_foreign_key :match_events, :clubs, column: :subject_team_id
    add_foreign_key :match_events, :players, column: :object_player_id
    add_foreign_key :match_events, :players, column: :subject_player_id

    # Add index for Match Events table
    # add_index :match_events, [:object_team_id, :subject_team_id], unique: true
    # add_index :match_events, [:object_player_id, :subject_player_id], unique: true

  end
end
