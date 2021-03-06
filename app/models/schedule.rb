class Schedule < ActiveRecord::Base
	validates :fare , presence: true
	belongs_to :agency
	belongs_to :route
	belongs_to :bus
  has_many :reservations
  after_create :set_availability
	
	#named_scope :with_day, lambda { |day| {:conditions => "days_mask & #{2**DAYS.index(day.to_s)} > 0"} }
  
  DAYS = %w[sunday monday tuesday wednesday thursday friday saterday]
  
  def days=(days)
    self.days_mask = (days & DAYS).map { |d| 2**DAYS.index(d) }.sum
  end
  
  def days
    DAYS.reject { |d| ((days_mask || 0) & 2**DAYS.index(d)).zero? }
  end
  
  def day_symbols
    days.map(&:to_sym)
  end

  def self.search(query1, query2)
    where(route_id: Route.where("from_station like ? and to_station like ?", "%#{query1}%", "%#{query2}%"))
  end

  #for updating the availability column for particular schedule when reservatoin is created
  def availabel=(seats_reserved)
    if self.availability.present?
      seats_availabel = self.availability - seats_reserved #if availability column has value
    else
      seats_availabel = Bus.total_seats(self.bus_number.to_i) - seats_reserved #if avalability is nil(in case: when schedule was created and availbaility is not stored)
    end
      
    self.update(availability: seats_availabel)
  end
 

  #update the availability with total number of seats in the bus when schedule is created
  def set_availability
    self.update(availability: self.bus.seats)
  end


  def get_routes
    @routes = Route.all.map { |route| [route.route_name, route.id] }
  end
end
