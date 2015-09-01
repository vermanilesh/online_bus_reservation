class Bus < ActiveRecord::Base
  validates :seats, :registration_number, presence: true
  validates :registration_number, uniqueness: true
  belongs_to :agency
  belongs_to :route
  has_many :schedules

  mount_uploader :avatar, AvatarUploader
end
