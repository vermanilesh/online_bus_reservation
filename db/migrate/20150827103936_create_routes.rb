class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.string :from_station
      t.string :to_station
      t.integer :distance

      t.timestamps
    end
  end
end
