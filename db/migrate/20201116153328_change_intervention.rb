class ChangeIntervention < ActiveRecord::Migration[5.2]
  def change
    add_column :interventions, :author, :integer
    add_column :interventions, :customer_id, :integer
    add_column :interventions, :building_id, :integer
    add_column :interventions, :column_id, :integer
    add_column :interventions, :employee_id, :integer
  end
end

