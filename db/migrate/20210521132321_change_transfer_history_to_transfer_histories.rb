class ChangeTransferHistoryToTransferHistories < ActiveRecord::Migration[6.1]
  def change
    rename_table :transfer_history, :transfer_histories
  end
end
