class RemoveRouteIdFromBuses < ActiveRecord::Migration
  def change
    remove_column :buses, :route_id, :integer
  end
end
