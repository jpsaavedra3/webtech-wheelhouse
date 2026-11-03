# The price list is public. Only the owner changes it.
class ServicePolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def new?
    create?
  end

  def create?
    owner?
  end

  def edit?
    update?
  end

  def update?
    owner?
  end

  def destroy?
    owner?
  end

  class Scope < ApplicationPolicy::Scope
    def resolve
      scope.all
    end
  end
end
