class RemoveDaysToSchedules < ActiveRecord::Migration
  def change
    remove_column :schedules, :days, :string
  end
end
