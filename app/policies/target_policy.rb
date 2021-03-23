class TargetPolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    record.user = user
    true
  end

  def show?
    true
  end

  class Scope < Scope
    def resolve
      # Own target list
      scope.where(user: user)
    end
  end
end
