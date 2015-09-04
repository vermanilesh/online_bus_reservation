class Schedule < ActiveRecord::Base
	validates :fare , presence: true
	belongs_to :agency
	belongs_to :route
	belongs_to :bus
	
	scope :with_day, lambda { |day| {:conditions => "days_mask & #{2**DAYS.index(day.to_s)} > 0"} }
  
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
  
  
end
