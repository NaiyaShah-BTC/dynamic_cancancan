class Ability
  include CanCan::Ability

  def initialize(user)
    # user ||= User.new
    #
    # if user.has_role? :teacher
    #     can :manage, Exam
    #     can :manage, Result
    #     can [:create, :update], User
    # elsif user.has_role? :student
    #   can :manage, Result
    # end

    user.role.permissions.each do |permission|
      if permission.subject_class == "all"
        can permission.action.to_sym, permission.subject_class.to_sym
      else
        can permission.action.to_sym, permission.subject_class.constantize
      end
    end
  end
end
