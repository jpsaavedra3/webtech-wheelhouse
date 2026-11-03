class RepairPolicy < ApplicationPolicy
  # Every account opens the list; the scope decides what is in it.
  def index?
    user.present?
  end

  # The same answer as the scope: a repair is readable when the scope contains it.
  def show?
    Scope.new(user, Repair).resolve.exists?(record.id)
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

  # Only the owner edits a repair that was handed back (the last state of the lifecycle).
  def update?
    return true if owner?
    return false if record.collected?

    counter? || (mechanic? && show?)
  end

  # Removing a photo is editing the repair.
  def remove_photo?
    update?
  end

  def destroy?
    owner?
  end

  # The fields each person writes. The controller takes this list as it is.
  def permitted_attributes
    if mechanic?
      [ :state, :diagnosis, { intake_photos: [] } ]
    else
      [ :bike_id, :quote_answered_by_id, :state, :received_at, :promised_on,
        :quote_answered_at, :collected_at, :diagnosis,
        { intake_photos: [],
          repair_services_attributes: [ :id, :service_id, :mechanic_id, :charged_price,
                                        :completed_at, :_destroy ] } ]
    end
  end

  class Scope < ApplicationPolicy::Scope
    # A mechanic's own repairs are the ones with a line assigned to the member of the staff
    # joined to their account. Without one, they have none.
    def resolve
      if owner? || counter?
        scope.all
      elsif mechanic? && user.staff_member_id
        scope.where(id: RepairService.where(mechanic_id: user.staff_member_id).select(:repair_id))
      else
        scope.none
      end
    end
  end
end
