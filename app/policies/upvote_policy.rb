class UpvotePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def new?
    user
  end

  def create?
    new?
  end

  def destroy?
    record.user.id == user.id
  end
end
