class AddAgencyNameToAgencies < ActiveRecord::Migration
  def change
    add_column :agencies, :agency_name, :string
  end
end
