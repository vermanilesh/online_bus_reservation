class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.references :user, index: true
      t.references :schedule, index: true
      t.integer :no_of_seats
      t.integer :fare
      t.date :journy_date

      t.timestamps
    end
  end
end
