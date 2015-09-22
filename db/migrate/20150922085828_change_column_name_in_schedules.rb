class ChangeColumnNameInSchedules < ActiveRecord::Migration
  def change
  	rename_column :schedules, :bus_number, :bus_id
  end
end
