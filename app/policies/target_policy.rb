class TargetPolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    record.user = user
    true
  end

  def show?
    record.user_id == user.id
    # or true - because the Scope filter by current_user
  end

  def destroy?
    record.user_id == user.id
    # or true - because the Scope filter by current_user
  end

  def linked?
    record.user_id == user.id
    # or true - because the Scope filter by current_user
  end

  class Scope < Scope
    def resolve
      # Own target list
      scope.where(user: user)
    end
  end
end
