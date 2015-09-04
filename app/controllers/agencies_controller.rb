class AgenciesController < ApplicationController
	
	before_action :authenticate_agency!

  def dashboard
  end
end
