class Route < ActiveRecord::Base
	has_many :buses
	has_many :agencies, through: :buses
end
