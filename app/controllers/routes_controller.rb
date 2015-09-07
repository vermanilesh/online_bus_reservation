class RoutesController < ApplicationController
  
  before_action :authenticate_agency!, except: :index
  before_action :set_routes, only: [:show, :edit, :update, :destroy]

  load_and_authorize_resource
  
  layout "sidebar_layout"

  respond_to :html
  
  def index
    @routes = current_agency.routes
    if @routes.blank?
      flash[:notice] = "There is no Route in your account, please add it first "
      redirect_to new_agency_route_path(current_agency)
    end
  end

  def show
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
      @route = current_agency.routes.find(params[:id])
    end
    
    def route_params
      params.require(:route).permit(:from_station, :to_station, :distance)
    end
end
