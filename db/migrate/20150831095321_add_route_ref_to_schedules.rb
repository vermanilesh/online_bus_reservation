class AddRouteRefToSchedules < ActiveRecord::Migration
  def change
    add_reference :schedules, :route, index: true
  end
end
