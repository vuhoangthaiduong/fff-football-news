class AddFieldsToLeagues < ActiveRecord::Migration[6.1]
  def change
    add_column :leagues, :venue, :string
    add_column :leagues, :founder, :string
    add_column :leagues, :founded_at, :date
  end
end
