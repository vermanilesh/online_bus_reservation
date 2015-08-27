class AddRegistrationNumberToBuses < ActiveRecord::Migration
  def change
    add_column :buses, :registration_number, :string
  end
end
