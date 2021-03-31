class AddArticleModel < ActiveRecord::Migration[6.1]
  def change
        
    # Articles table
    create_table :articles do |t|
      t.string :title
      t.string :content
      t.string :description
      t.integer :view_count
      t.timestamps
    end

    # Add index for Articles table
    add_index :articles, :title

    # Add FKs for Articles table
    add_reference :articles, :user, index: true
    add_foreign_key :articles, :users

  end
end
