# Home, visiting and about: every account may read them.
class PagePolicy < ApplicationPolicy
  def home?
    user.present?
  end

  def visiting?
    user.present?
  end

  def about?
    user.present?
  end
end
