class Schedule < ActiveRecord::Base
	validates :fare , presence: true
	belongs_to :agency
	belongs_to :route
	belongs_to :bus
end
