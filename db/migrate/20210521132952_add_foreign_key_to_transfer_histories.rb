class AddForeignKeyToTransferHistories < ActiveRecord::Migration[6.1]
  def change
    add_reference :transfer_histories, :player
    add_foreign_key :transfer_histories, :players
  end
end
