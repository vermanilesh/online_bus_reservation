class AddDaysMaskToSchedules < ActiveRecord::Migration
  def change
    add_column :schedules, :days_mask, :integer
  end
end
