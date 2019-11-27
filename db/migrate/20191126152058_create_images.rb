class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.references  :article,    null: false, foreign_key: true, on_delete: :cascade
      t.string  :url,            null: false
      t.timestamps
    end
  end
end
