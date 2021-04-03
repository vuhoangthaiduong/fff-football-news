class AddTransferHistoryModel < ActiveRecord::Migration[6.1]
  def change
        
    # TransferHistory table
    create_table :transfer_history do |t|
      t.date :date_of_transfer
      t.decimal :price, precision: 10, scale: 4
      t.references :from_club, null: false
      t.references :to_club, null: false
      t.timestamps
    end

    add_foreign_key :transfer_history, :clubs, column: :from_club_id
    add_foreign_key :transfer_history, :clubs, column: :to_club_id

  end
end
