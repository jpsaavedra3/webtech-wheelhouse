# frozen_string_literal: true

# Written by `bin/rails generate pundit:install`. Every question answers false, so an action
# whose policy method has not been written is refused, never allowed.
class ApplicationPolicy
  # What each policy asks about the account. The names come from the enum of User:
  # no policy writes a role as a string.
  module Roles
    private

    def owner?
      user&.owner?
    end

    def counter?
      user&.counter?
    end

    def mechanic?
      user&.mechanic?
    end
  end

  include Roles

  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    false
  end

  def show?
    false
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  class Scope
    include Roles

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      raise NoMethodError, "You must define #resolve in #{self.class}"
    end

    private

    attr_reader :user, :scope
  end
end
