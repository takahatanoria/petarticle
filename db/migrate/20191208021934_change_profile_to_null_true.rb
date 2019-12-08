class ChangeProfileToNullTrue < ActiveRecord::Migration[5.2]
  def change
    change_column :profiles, :birth_year,  :string, null: true
    change_column :profiles, :birth_month,  :string, null: true
    change_column :profiles, :birth_day,  :string, null: true
  end
end
