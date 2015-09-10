class AddRoleToSchedules < ActiveRecord::Migration
  def change
    add_column :schedules, :role, :string
  end
end
