class AddAvailabilityToSchedules < ActiveRecord::Migration
  def change
    add_column :schedules, :availability, :integer
  end
end
