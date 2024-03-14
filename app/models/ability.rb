# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user = current_user)
    return unless user

    if user.admin?
      can :manage, :all
    else
      can :read, Movie

      can :read, Show

      can :read, Booking, user_id: user.id
      can :create, Booking
      can :destroy, Booking, user_id: user.id
    end
  end
end
