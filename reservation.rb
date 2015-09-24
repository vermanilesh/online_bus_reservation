class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :schedule
  has_many :passengers
  after_create :update_availabel_seats

  
  def update_availabel_seats
    self.schedule.availabel = self.no_of_seats
  end

  def get_route_name
  	self.schedule.route.route_name
  end

  def get_registration_number
  	self.schedule.bus.registration_number
  end

  def dep_time
  	self.schedule.departure_time.strftime("%I:%M %p")
  end

  def arr_time
  	self.schedule.arrival_time.strftime("%I:%M %p")
  end
end
