class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :schedule
  has_many :passengers
  after_create :update_availabel_seats

  
  def update_availabel_seats
    self.schedule.availabel = self.no_of_seats
  end
end
