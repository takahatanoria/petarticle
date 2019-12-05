class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.bigint  :user_id, null: false 
      t.bigint  :article_id, null: false 
      t.timestamps
    end
  end
end
