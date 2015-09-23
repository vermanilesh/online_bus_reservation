class AgenciesController < ApplicationController
	
	before_action :authenticate_agency!
  layout "agency_layout"

  def dashboard
  end
end
