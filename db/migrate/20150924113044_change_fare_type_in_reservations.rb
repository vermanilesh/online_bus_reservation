class ChangeFareTypeInReservations < ActiveRecord::Migration
  def change
  	change_column :reservations, :fare, :float
  end
end
