class SchedulesController < ApplicationController

  before_action :authenticate_agency!, except: :index
  before_action :set_schedule, only: [:show, :edit, :update, :destroy]

  load_and_authorize_resource 
  
  layout "sidebar_layout"

  respond_to :html

  def index
    if agency_signed_in?
      schedule_for_agency(params[:from],params[:to])
    elsif params[:from].present? and params[:to].present? 
      schedule_for_users
    else
      flash[:error] = "please enter search words"
      redirect_to root_path
    end
  end


  def new
  	@schedule = current_agency.schedules.new
  	respond_with(@schedule)
  end


  def edit
  end


	def create
		@schedule = current_agency.schedules.new(schedule_params)

    if @schedule.save
      flash[:alert] = "New Schedule created"    
    end
    respond_with(current_agency, @schedule)  
	end  


  def update
    if @schedule.update(schedule_params)
      flash[:alert] = "Schedule Edited Succefully"
    end
    respond_with(current_agency, @schedule)
  end


  def destroy
    @schedule.destroy
    flash[:alert] = "One Schedule Deleted"
    redirect_to agencies_dashboard_path
  end


	private

  def set_schedule
    @schedule = current_agency.schedules.find(params[:id])
  end

	def schedule_params
    params.require(:schedule).permit(:departure_time, :arrival_time, :fare, :route_id, :bus_number, :days => [])
  end

  def schedule_for_agency(from, to)
    if from.present? and to.present?
      search_with_stations(from, to)
    else  
      all_schedule_for_agency        
    end
  end

  def schedule_for_users
    @schedules = Schedule.search(params[:from], params[:to])
    if @schedules.blank?
      flash[:error] = "No Schedule Matches, please enter other stations"
      redirect_to root_path
    end
  end

  def search_with_stations(from, to)
    @schedules = current_agency.schedules.search(from, to)

    if @schedules.blank?
      flash[:notice] = "No Schedule Matches, You can create new"
      redirect_to new_agency_schedule_path(current_agency)
    end
  end

  def all_schedule_for_agency

    @schedules = current_agency.schedules
      
    if @schedules.blank?

      flash[:notice] = "There is no Schedule in your account, please add it first "
      redirect_to new_agency_schedule_path(current_agency)
    end
  end
end
