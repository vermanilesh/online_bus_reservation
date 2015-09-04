class AddDaysToSchedules < ActiveRecord::Migration
  def change
    add_column :schedules, :days, :text
  end
end
