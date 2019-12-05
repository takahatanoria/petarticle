class ChangeImageToavatar < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :image, :string
    add_column :users, :avatar, :text
  end
end
