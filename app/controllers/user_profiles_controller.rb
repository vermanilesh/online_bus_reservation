class UserProfilesController < ApplicationController
  before_action :authenticate_user!
  def new
  	@user_profile = UserProfile.new
  end

  def edit
    @user_profile = current_user.user_profile()
  end

  def show
    @user_profile = current_user.user_profile
  end

  def create
  	@user_profile = current_user.build_user_profile(user_profile_params)
    if @user_profile.save
      flash[:notice] = "Your Profile Created Successfully"
      redirect_to  user_user_profile_path(current_user, @user_profile)
    end
  end

  def update
    @user_profile = current_user.user_profile
    if @user_profile.update(user_profile_params)
      flash[:notice] = "Your Profile Updated Successfully"
      redirect_to user_user_profile_path(current_user, @user_profile)
    end
  end

  def destroy
    @user_profile = current_user.user_profile
    @user_profile.destroy
    flash[:alert] = "Your Profile has been deleted"
    redirect_to users_dashboard_path(current_user)
  end

  def subregion_options
    render partial: "state_select"
  end

  private
  	def user_profile_params
  		params.require(:user_profile).permit(:f_name, :l_name, :mobile_number, :age, :gender, :address, :country, :state, :dob)
  	end
end
