class AddCommentModel < ActiveRecord::Migration[6.1]
  def change
    # Comments table
    create_table :comments do |t|
      t.string :content
      t.string :description
      t.integer :thumbs_up
      t.integer :thumbs_down
      t.timestamps
    end

    # Add index for Comments table
    add_index :comments, :content

    #Add FKs for Comments table
    add_reference :comments, :user, index: true
    add_foreign_key :comments, :users
    add_reference :comments, :article, index: true
    add_foreign_key :comments, :articles
  end
end
