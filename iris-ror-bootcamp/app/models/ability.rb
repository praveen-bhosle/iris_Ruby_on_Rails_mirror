class Ability
  include CanCan::Ability

  def initialize(user)
     # Here in the function, we are not sure if the user is logged in or not
     # Public Permissions can be defined here 
     can :read, Form, public: true

     return unless user.present?
     # At this point we know that the user is logged in
     # A logged in user perform any action on any form that they own
     can :manage, Form, user: user

     return unless user.superuser?
     # At this point we know that the user is a superuser
     # A superuser is allowed to do everything
     can :manage, :all
  end
end