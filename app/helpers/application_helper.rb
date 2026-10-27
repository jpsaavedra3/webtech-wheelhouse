module ApplicationHelper
  def money(amount)
    number_to_currency(amount, unit: "$", precision: 0, delimiter: ".")
  end

  def field_class(object, attribute, base = "form-control")
    object.errors[attribute].any? ? "#{base} is-invalid" : base
  end

  def field_errors(object, attribute)
    return if object.errors[attribute].empty?

    tag.div object.errors.full_messages_for(attribute).to_sentence,
            class: "invalid-feedback d-block"
  end

  def bike_label(bike)
    "#{bike.bike_model.brand} #{bike.bike_model.name} — #{bike.serial_number || 'no serial'}"
  end

  def photo_alt(repair)
    "#{bike_label(repair.bike)}, repair ##{repair.id}"
  end

  # An account is shown by the name of its member of the staff, or by its email address.
  def account_label(user)
    user.staff_member&.name || user.email_address
  end
end
