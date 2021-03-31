class AddPlayerModel < ActiveRecord::Migration[6.1]
  def change
        
    # Players table
    create_table :players do |t|
      t.string :name
      t.date :dob
      t.string :description
      t.integer :view_count
      t.timestamps
    end

    # Add index for Players table
    add_index :players, :name

    # Add FKs for Players table
    add_reference :players, :club, index: true
    add_foreign_key :players, :clubs

  end
end
