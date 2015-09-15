class ReservationsController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @reservation = current_user.reservations.new
  end

  def index
    @reservations = current_user.reservations
  end

  def create
    @reservation = current_user.reservations.new(reservation_params)
    @reservation.schedule_id = params[:schedule_id] 
    if @reservation.save
      redirect_to root_path
    end
  end

  private
    def reservation_params
      params.require(:reservation).permit(:no_of_seats, :journy_date, :fare)
    end
end
