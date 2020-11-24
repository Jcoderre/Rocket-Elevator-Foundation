class CreateElevatorMedia < ActiveRecord::Migration[5.2]
  def change
    create_table :elevator_media do |t|

      t.timestamps
    end
  end
end
