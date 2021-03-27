class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username
      t.date :dob
      t.string :email
      t.string :password_digest
      t.string :phone_number
      t.decimal :balance, precision: 10, scale: 4
      t.boolean :is_admin
      t.timestamps
    end

    add_index :users, :username, unique: true
    add_index :users, :email
    add_index :users, :phone_number

  end
end
