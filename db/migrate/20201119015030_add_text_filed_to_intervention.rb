class AddTextFiledToIntervention < ActiveRecord::Migration[5.2]
  def change
    add_column :interventions, :description, :text
  end
end
