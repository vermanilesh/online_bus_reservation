class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  
  protect_from_forgery with: :null_session

  def after_sign_in_path_for(resource)
  	if resource_name.capitalize.to_s == "User"
  		users_dashboard_path
  	elsif resource_name.capitalize.to_s == "Agency"
  		agencies_dashboard_path
  	end
  end


end
