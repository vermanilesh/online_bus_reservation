class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # include CanCan::ControllerAdditions
  
  protect_from_forgery with: :null_session

  def after_sign_in_path_for(resource)
  	if user_signed_in?
  		users_dashboard_path
  	elsif agency_signed_in?
  		agencies_dashboard_path
    elsif admin_user_signed_in?
      admin_dashboard_path
  	end
  end

  def current_ability
    if agency_signed_in?
      @current_ability = Ability.new(current_agency)
    elsif user_signed_in?
      @current_ability = Ability.new(current_user)
    else
      @current_ability = Ability.new(current_admin_user)
    end
  end
    

  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = "you are not auhtorized to perform this action"
    render status: 401
  end
end
