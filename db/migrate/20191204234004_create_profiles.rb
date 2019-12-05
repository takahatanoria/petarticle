class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.bigint  :user_id, null: false 
      t.text    :self_introduction
      t.text    :avatar
      t.integer :prefectures, null: false     
      t.string  :city
      t.string  :phone_number, null: false
      t.string  :birth_year, null: false
      t.string  :birth_month, null: false
      t.string  :birth_day, null: false      
      t.integer :age, null: false
      t.integer :gender, null: false
      t.string  :occupation
      t.integer :expert
      t.timestamps
    end
  end
end
