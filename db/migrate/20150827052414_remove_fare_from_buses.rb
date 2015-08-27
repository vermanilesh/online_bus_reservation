class RemoveFareFromBuses < ActiveRecord::Migration
  def change
    remove_column :buses, :fare, :integer
  end
end
