class ChangeBusNumberTypeInSchedules < ActiveRecord::Migration
  def change
    change_column :schedules, :bus_number, :integer
  end
end
