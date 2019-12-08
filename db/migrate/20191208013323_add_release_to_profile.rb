class AddReleaseToProfile < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :release, :integer, null: false
  end
end
