class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end


  def show?
    true
  end

end
