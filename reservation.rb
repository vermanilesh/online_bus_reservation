class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :schedule
  has_many :passengers

  
  def self.reserved_seats(reservations)
    
    seats_reserved = 0
  	reservations.each do |reservation|
  		seats_reserved = seats_reserved + reservation.no_of_seats
  	end
    seats_reserved
  end
end
