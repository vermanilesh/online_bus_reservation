class Bus < ActiveRecord::Base
	validates :seats, :registration_number, presence: true
	validates :registration_number, uniqueness: true
  belongs_to :agency
end
