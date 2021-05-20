class ChangeTypeStartAtFromMatches < ActiveRecord::Migration[6.1]
  def change
    change_column :matches, :start_at, :datetime
    change_column :matches, :end_at, :datetime
  end
end
