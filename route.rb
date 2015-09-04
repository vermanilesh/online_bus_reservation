class Route < ActiveRecord::Base
	validates :from_station, :to_station, :distance, presence: true
	has_many :buses
  has_many :schedules
	belongs_to :agency
	

	def route_name
		"#{from_station}->#{to_station}"
	end
end
