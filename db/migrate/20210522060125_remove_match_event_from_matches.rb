class RemoveMatchEventFromMatches < ActiveRecord::Migration[6.1]
  def change
    remove_column :matches, :match_event, :string
  end
end
