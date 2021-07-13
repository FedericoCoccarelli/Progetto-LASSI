# frozen_string_literal: true


class Ability
  include CanCan::Ability
  def initialize(user)

    if not user.coolness.nil?
      if user.coolness == 0
      end

      if user.coolness >= 1
        can [:create], :all
        can [:update, :destroy], Answer 
        can [:destroy,:update], Question
      end
      if user.coolness >= 2
        can [:index,:update] , User


      end
      if user.coolness >= 3 
        can :destroy, User
      end
    end
  end
end