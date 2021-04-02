class AddClubModel < ActiveRecord::Migration[6.1]
  def change

    # Clubs table
    create_table :clubs do |t|
      t.string :name
      t.string :history
      t.string :stadium
      t.string :founder
      t.date :founded_at
      t.timestamps
    end

    # Add index for Users table
    add_index :clubs, :name
    add_index :clubs, :stadium
    add_index :clubs, :founder
  end
end
