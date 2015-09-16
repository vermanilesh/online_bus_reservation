class ReservationsController < ApplicationController
  before_action :authenticate_user!
  
  
  def new
    @reservation = current_user.reservations.new
  end

  def index
    @reservations = current_user.reservations
  end

  def show
    @reservation = current_user.reservations.find(params[:id])
  end

  def create
    @reservation = current_user.reservations.new(reservation_params)
    @reservation.schedule_id = params[:schedule_id] 
    if @reservation.save
      redirect_to agency_schedule_reservation_path(params[:agency_id], params[:schedule_id], @reservation)
    end
  end

  private
    def reservation_params
      params.require(:reservation).permit(:no_of_seats, :fare, :journy_date, :id, :schedule_id)
    end
end
