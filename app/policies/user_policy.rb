class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end

    def show?
      scope.where(:id => record.id).exists?
    end

    def edit?
      record == user
    end

    def update?
      edit?
    end
  end
end
