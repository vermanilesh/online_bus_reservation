class AddDobToUserProfiles < ActiveRecord::Migration
  def change
    add_column :user_profiles, :dob, :date
  end
end
