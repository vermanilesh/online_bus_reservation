class RoutesController < ApplicationController
  
  respond_to :html
  
  def index
  	@routes = Route.all
  	respond_with(@routes)
  end

  def show
  	
  end

  def new
  	@route = Route.new
  end

  def edit
  	@route = Route.find(params[:id])
  end

  def create
  	@route = Route.new(params[:route].permit(:from_station, :to_station, :distance))
  	@route.save
  	redirect_to routes_path
  end

  def update
  	@route = Route.find(params[:id])
  	if @route.update(params[:route].permit(:from_station, :to_station, :distance))
  		flash[:alert] = "Route Updated"	
  	end
  	redirect_to routes_path
  end

  def destroy
  	@route = Route.find(params[:id])
  	@route.destroy
  	flash[:alert] = "Route Deletd"
  	redirect_to routes_path
  end
end
