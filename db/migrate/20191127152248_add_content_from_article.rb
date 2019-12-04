class AddContentFromArticle < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :content, :text
    add_column :articles, :category_id, :integer

  end
end
