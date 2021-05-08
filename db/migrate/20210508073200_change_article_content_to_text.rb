class ChangeArticleContentToText < ActiveRecord::Migration[6.1]
  def change
    reversible do |dir|
      change_table :articles do |t|
        dir.up   { t.change :content, :text }
        dir.down { t.change :content, :string }
      end
    end
  end
end
