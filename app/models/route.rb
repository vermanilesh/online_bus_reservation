class Route < ActiveRecord::Base
	validates :from_station, :to_station, :distance, presence: true
	has_many :buses
	belongs_to :agencies
end
