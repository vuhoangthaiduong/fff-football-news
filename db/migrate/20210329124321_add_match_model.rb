class AddMatchModel < ActiveRecord::Migration[6.1]
  def change
        
    # Matches table
    create_table :matches do |t|
      t.date :start_at
      t.date :end_at
      t.integer :duration
      t.string :stage_in_league
      t.string :judge_name
      t.integer :first_team_goal_count
      t.integer :second_team_goal_count
      t.string :match_event
      t.references :first_team_id, foreign_key: true
      t.references :second_team_id, foreign_key: { to_table: 'clubs' }
      t.timestamps
    end

    # add_foreign_key :matches, :clubs, column: :first_team_id
    # add_foreign_key :matches, :clubs, column: :second_team_id

  end
end
