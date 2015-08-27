class RemoveArrivalTimeFromBuses < ActiveRecord::Migration
  def change
    remove_column :buses, :arrival_time, :time
  end
end
