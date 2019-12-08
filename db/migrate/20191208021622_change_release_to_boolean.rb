class ChangeReleaseToBoolean < ActiveRecord::Migration[5.2]
  def change
    change_column :profiles, :release,  :boolean
  end
end
