class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.time :departure_time
      t.time :arrival_time
      t.integer :fare
      t.references :agency

      t.timestamps
    end
  end
end
