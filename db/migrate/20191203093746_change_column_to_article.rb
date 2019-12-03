class ChangeColumnToArticle < ActiveRecord::Migration[5.2]
  def up
    change_column :articles, :content,:text, null: false
    change_column :articles, :title,:string, null: false
    change_column :articles, :user_id,:integer, null: false

  end

  def down
    change_column :articles, :content,:text
    change_column :articles, :title,:string
    change_column :articles, :user_id,:integer


  end
end
