class AddBatteryIdToInterventions < ActiveRecord::Migration[5.2]
  def change
    add_column :interventions, :battery_id, :integer
  end
end
