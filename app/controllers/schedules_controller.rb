class SchedulesController < ApplicationController

  before_action :authenticate_agency!, except: :index
  before_action :set_schedule, only: [:show, :edit, :update, :destroy]

  load_and_authorize_resource 
  
  layout "sidebar_layout"

  respond_to :html

  def index
    if agency_signed_in?
    	@schedules = current_agency.schedules
      if @schedules.blank?
        flash[:notice] = "There is no Schedule in your account, please add it first "
        redirect_to new_agency_schedule_path(current_agency)
      end
    else
      @schedules = Schedule.all
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
    redirect_to agency_schedules_path
  end


	private

  def set_schedule
    @schedule = current_agency.schedules.find(params[:id])
  end
	def schedule_params
    params.require(:schedule).permit(:departure_time, :arrival_time, :fare, :route_id, :bus_number, :days_mask)
  end
end
