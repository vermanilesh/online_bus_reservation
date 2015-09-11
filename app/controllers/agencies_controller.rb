class AgenciesController < ApplicationController
	
	before_action :authenticate_agency!
  layout "sidebar_layout"

  def dashboard
  end
end
