class ChangeColumnToNotNullCategory < ActiveRecord::Migration[5.2]
  def up
    change_column :articles, :category_id,:integer, null: false
  end

  def down
    change_column :articles, :category_id,:integer
  end
end
