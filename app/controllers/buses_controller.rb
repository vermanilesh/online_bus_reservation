class BusesController < ApplicationController
  before_action :authenticate_agency!
  before_action :set_bus, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    if current_agency.present?
      @buses = current_agency.buses
      respond_with(@buses)  
    else
      flash[:alert] = "You must be logged in"
      redirect_to new_agency_session_path      
    end
    
  end

  def show
    respond_with(@bus)
  end

  def new
    @bus = current_agency.buses.new
    respond_with(@bus)
  end

  def edit
  end

  def create
    @bus = current_agency.buses.new(bus_params)
    if @bus.save
      flash[:alert] = "new Bus added"
    end
    respond_with(current_agency, @bus)
  end

  def update
    if @bus.update(bus_params)
      flash[:alert] = "Bus Updated"
    end
    respond_with(current_agency, @bus)
  end

  def destroy
    @bus.destroy
    flash[:alert] = "Bus Deleted"
    redirect_to agency_buses_path
  end

  private
    def set_bus
      @bus = Bus.find(params[:id])
    end

    def bus_params
      params.require(:bus).permit(:bus_type, :seats, :agency_id, :registration_number)
    end
end
