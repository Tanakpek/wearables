class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all # If users can see all restaurants
      # scope.where(user: user) # If users can only see their restaurants
      # scope.where("name LIKE 't%'") # If users can only see restaurants starting with `t`
      # ...
    end
  end

  def show?
    record.id == user.id
  end

  # def create?
  #   true
  # end

  # def update?
  #   record.user == user || user.admin?
  # end

  # def destroy?
  #   record.user == user || user.admin?
  # end
end
