class AddOwnerNameToAgencies < ActiveRecord::Migration
  def change
    add_column :agencies, :owner_name, :string
  end
end
