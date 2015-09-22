class RemoveAgencyIdFromRoutes < ActiveRecord::Migration
  def change
    remove_column :routes, :agency_id, :integer
  end
end
