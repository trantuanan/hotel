class Ability
  include CanCan::Ability
  def initialize(user)
    user ||= User.new
    if user.admin?
      can :manage, :all
    else
      can :manage, User, id: user.id
      can :update, [Review, Comment, Replie], id: user.id
      can :destroy, [Review, Comment, Replie], id: user.id
      can [:show], [Hotel, Review, Comment, Replie]
    end
  end
end
