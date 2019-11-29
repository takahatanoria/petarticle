class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.bigint :user_id, null: false, foreign_key: true
      t.bigint :article_id, null: false, foreign_key: true
      t.text :content, null: false
      t.timestamps
    end
  end
end
