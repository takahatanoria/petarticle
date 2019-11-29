class ChangeColumnToAllowForeignkey < ActiveRecord::Migration[5.2]
  def change
    def up
      change_column :articles, :user_id,:bigint, null: false, foreign_key: true 
    end
  
    def down
      change_column :articles, :user_id,:bigint
    end
  end
end
