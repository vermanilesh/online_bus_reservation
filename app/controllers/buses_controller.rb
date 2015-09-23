class BusesController < ApplicationController

  before_action :authenticate_agency!
  before_action :set_bus, only: [:show, :edit, :update, :destroy]
  
  load_and_authorize_resource

  layout "agency_layout"

  respond_to :html

  def index
    @buses = current_agency.buses
    if @buses.blank?
      flash[:notice] = "There is no Bus in your account, please add it first "
      redirect_to new_agency_bus_path(current_agency)
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
    redirect_to agencies_dashboard_path
  end



  private
    def set_bus
      @bus = current_agency.buses.where(params[:id]).first
    end

    def bus_params
      params.require(:bus).permit(:bus_type, :seats, :agency_id, :registration_number, :avatar)
    end

end
