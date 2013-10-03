class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :read, Coupon, :hidden => false
    cannot :read, Coupon, :end_date.lt => Time.now
    cannot :read, Coupon, :begin_date.gt => Time.now

    can :read, Category

    can :read, PointOfContact

    can :read, Merchant, :approved => true

    if user.persisted?
      can :manage, Merchant, :user_id => user.id
      can :manage, Coupon, :merchant => {:user_id => user.id}
    end

  end
end
