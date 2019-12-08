class ChangePrefecturesToNullTrue < ActiveRecord::Migration[5.2]
  def change
    change_column :profiles, :prefectures,  :integer, null: true
  end
end
