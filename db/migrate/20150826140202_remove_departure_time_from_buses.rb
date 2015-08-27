class RemoveDepartureTimeFromBuses < ActiveRecord::Migration
  def change
    remove_column :buses, :departure_time, :time
  end
end
