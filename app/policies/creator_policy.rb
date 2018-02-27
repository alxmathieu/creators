class CreatorPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def index?
    true
  end

  def show?
    true
  end

  def new?
    # n'authoriser que pour les user avec un certain level
    true
  end

  def create?
    # n'authoriser que pour les user avec un certain level
    new?
  end

  def update?
    record.user == user
  end
end
