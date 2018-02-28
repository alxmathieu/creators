class UpvotePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def new?
    true
  end

  def create?
    new?
  end

  def destroy?
    record.user == user
  end
end
