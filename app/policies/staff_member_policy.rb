# Every account reads the staff list. Only the owner changes it.
class StaffMemberPolicy < ApplicationPolicy
  def index?
    user.present?
  end

  def show?
    user.present?
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
      user ? scope.all : scope.none
    end
  end
end
