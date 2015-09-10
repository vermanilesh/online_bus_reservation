class Agency < ActiveRecord::Base
	has_many :buses, dependent: :destroy
	has_many :routes, dependent: :destroy
	has_many :schedules, dependent: :destroy
	
	#accepts_nested_attributes_for :routes, allow_destroy: true
	#accepts_nested_attributes_for :buses, allow_destroy: true
	#accepts_nested_attributes_for :schedules, allow_destroy: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable, :confirmable
end
