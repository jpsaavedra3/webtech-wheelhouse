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
end
