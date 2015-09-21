class ReservationsController < ApplicationController
  before_action :authenticate_user!
  after_action :send_email, only: :create
  before_action :get_schedule, except: :index

  respond_to :html, :js
  
  def new
    @reservation = current_user.reservations.new(fare: @schedule.fare)
  end

  def index
    @reservations = current_user.reservations.map { |reservation| reservation if reservation.schedule.present? and reservation.schedule.agency.present?  }
  end

  def show
    @reservation = current_user.reservations.where(id: params[:id]).first
  end

  def create
    @reservation = current_user.reservations.new(reservation_params)
    @reservation.schedule_id = params[:schedule_id] 
    @reservation.journy_date = get_date
    if @reservation.save
      redirect_to agency_schedule_reservation_path(params[:agency_id], params[:schedule_id], @reservation)
    end
  end

  def send_email
    UserMailer.reservation_email(@reservation.user).deliver
  end

  private
    def reservation_params
      params.require(:reservation).permit(:no_of_seats, :fare, :journy_date, :schedule_id)
    end

    def get_schedule 
      @schedule = Agency.where(id: params[:agency_id]).first.schedules.first
    end

    def get_date
      date = DateTime.strptime(reservation_params[:journy_date], "%m/%d/%Y")
    end
end
