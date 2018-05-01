class CreatorPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.ordered_upvotes
    end
  end

  def index?
    true
  end

  def show?
    true
  end

  def new?
    true
  end

  def create?
    new?
  end

  def update?
    record.user == user
  end
end
