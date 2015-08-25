class CreateBuses < ActiveRecord::Migration
  def change
    create_table :buses do |t|
      t.string :bus_type
      t.integer :seats
      t.integer :fare
      t.time :departure_time
      t.time :arrival_time
      t.references :agency, index: true

      t.timestamps
    end
  end
end
