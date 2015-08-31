class AddBusNumberToSchedules < ActiveRecord::Migration
  def change
    add_column :schedules, :bus_number, :string
  end
end
