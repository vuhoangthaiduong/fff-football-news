class CreateJoinTableMatchesPlayers < ActiveRecord::Migration[6.1]
  def change
    create_join_table :matches, :players do |t|
      # t.index [:match_id, :player_id]
      # t.index [:player_id, :match_id]
      t.integer :enter_at
      t.integer :exit_at
      t.integer :goal_count
    end
  end
end
