class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.class == AdminUser
      can :manage, :all
    elsif user.class == Agency
      can :manage, Route
      can :manage, Bus
      can :manage, Schedule
    else
      can :read, :all
    end  
  end
end
