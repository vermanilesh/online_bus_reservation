class User < ActiveRecord::Base
  has_one :user_profile, dependent: :destroy
  has_many :reservations

	devise :database_authenticatable, :registerable,
		:recoverable, :rememberable, :trackable, :validatable, :confirmable
end
