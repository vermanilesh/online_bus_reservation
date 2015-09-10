class RemoveRoleToSchedules < ActiveRecord::Migration
  def change
    remove_column :schedules, :role, :string
  end
end
