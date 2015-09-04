class Agency < ActiveRecord::Base
	has_many :buses
	has_many :routes
	has_many :schedules
	
	accepts_nested_attributes_for :routes
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
end
