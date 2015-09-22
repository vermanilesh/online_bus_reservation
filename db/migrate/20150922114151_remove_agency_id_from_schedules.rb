class RemoveAgencyIdFromSchedules < ActiveRecord::Migration
  def change
    remove_column :schedules, :agency_id, :integer
  end
end
