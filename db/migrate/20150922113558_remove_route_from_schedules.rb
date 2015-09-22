class RemoveRouteFromSchedules < ActiveRecord::Migration
  def change
  	remove_column :schedules, :route, :string
  end
end
