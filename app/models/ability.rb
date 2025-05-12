# app/models/ability.rb
class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Guest user (no roles)
    if user.has_role?(:admin)
      can :manage, :all
    elsif user.has_role?(:author)
      can :create, Article
      can :manage, Article, user_id: user.id
    else
      can :read, Article
    end
  end
end