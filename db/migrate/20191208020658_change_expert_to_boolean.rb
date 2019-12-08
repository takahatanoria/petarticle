class ChangeExpertToBoolean < ActiveRecord::Migration[5.2]
  def change
    change_column :profiles, :expert,  :boolean
  end
end
