class Route < ActiveRecord::Base
	validates :from_station, :to_station, :distance, presence: true
  has_many :schedules
  has_many :buses, through: :schedules
	

	def route_name
		"#{from_station}->#{to_station}"
	end
end
