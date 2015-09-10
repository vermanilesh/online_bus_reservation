class AddAddressToUserProfiles < ActiveRecord::Migration
  def change
    add_column :user_profiles, :address, :text
  end
end
