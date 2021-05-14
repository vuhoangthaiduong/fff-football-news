class RenameFounderToManagerInClubs < ActiveRecord::Migration[6.1]
  def change
    rename_column :clubs, :founder, :manager
  end
end
