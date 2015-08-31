class AddRouteToSchedules < ActiveRecord::Migration
  def change
    add_column :schedules, :route, :string
  end
end
