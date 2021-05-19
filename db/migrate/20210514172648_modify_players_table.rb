class ModifyPlayersTable < ActiveRecord::Migration[6.1]
  def change
    remove_column :players, :view_count, :integer
    remove_column :players, :description, :string

    # Add FKs for Players table
    add_reference :players, :position
    add_foreign_key :players, :positions
    add_reference :players, :nationality
    add_foreign_key :players, :nationalities

  end
end
