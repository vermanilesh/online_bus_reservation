class RoutesController < ApplicationController
  before_action :authenticate_agency!
  before_action :set_routes, only: [:show, :edit, :update, :destroy]

  respond_to :html
  
  def index
    if agency_signed_in?
      @routes = current_agency.routes
      respond_with(@routes)
    else
      flash[:error] = "you must be log in first"
      redirect_to new_agency_session_path
    end
  end

  def show
    respond_with(@route)
  end

  def new
  	@route = current_agency.routes.new
    respond_with(@route)
  end

  def edit
  end

  def create
  	@route = current_agency.routes.new(route_params)
  	if @route.save
      flash[:alert] = "New Route Added"
    end
    respond_with(current_agency, @route)
  end

  def update
  	@route = Route.find(params[:id])
  	if @route.update(route_params)
  		flash[:alert] = "Route Updated"	
  	end
  	respond_with(current_agency, @route)
  end

  def destroy
  	@route.destroy
    flash[:alert] = "Route Deleted"
    redirect_to agency_routes_path
  end

  private
    def set_routes
      @route = Route.find(params[:id])
    end
    
    def route_params
      params.require(:route).permit(:from_station, :to_station, :distance)
    end
end
