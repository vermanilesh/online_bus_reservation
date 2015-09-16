class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :schedule
  has_many :passengers
  after_create :update_availabel_seats

  
  def update_availabel_seats
    @reservation = self.all
    seats_reserved = 0
  	seats_reserved = seats_reserved + @reservation.no_of_seats
    @reservation.schedule.availabel = seats_reserved
  end
end
