class ChangeurlTotext < ActiveRecord::Migration[5.2]
  def change
    change_column :images, :url,  :text
  end
end
