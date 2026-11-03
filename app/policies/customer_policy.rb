# The owner and the counter deal with customers and their bikes. A mechanic does not.
class CustomerPolicy < ApplicationPolicy
  def index?
    owner? || counter?
  end

  def show?
    owner? || counter?
  end

  def new?
    create?
  end

  def create?
    owner? || counter?
  end

  def edit?
    update?
  end

  def update?
    owner? || counter?
  end

  def destroy?
    owner?
  end

  class Scope < ApplicationPolicy::Scope
    def resolve
      owner? || counter? ? scope.all : scope.none
    end
  end
end
