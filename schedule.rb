class Schedule < ActiveRecord::Base
	validates :fare , presence: true
	belongs_to :agency
	belongs_to :route
	belongs_to :bus
  has_many :reservations
	
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

  def availabel=(seats_reserved) 
    seats_availabel = self.availability - seats_reserved
    self.update(availability: seats_availabel)
  end

  def find_registration_number
    Bus.where(id: self.bus_number.to_i).pluck("registration_number")[0]
  end

  def find_bus_type
    Bus.where(id: self.bus_number.to_i).pluck("bus_type")[0]
  end
end
