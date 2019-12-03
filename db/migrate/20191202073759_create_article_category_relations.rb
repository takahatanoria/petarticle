class CreateArticleCategoryRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :article_category_relations do |t|
      t.bigint :article_id, null: false, foreign_key: true
      t.bigint :category_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
