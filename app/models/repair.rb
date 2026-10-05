class Repair < ApplicationRecord
  belongs_to :bike
  belongs_to :received_by,       class_name: "User"
  belongs_to :quote_answered_by, class_name: "User", optional: true

  has_many :repair_services, dependent: :destroy
  has_many :services, through: :repair_services, dependent: :destroy
  accepts_nested_attributes_for :repair_services, allow_destroy: true, reject_if: ->(attributes) { attributes[:service_id].blank? }

  # Only what the phones of the shop produce. HEIC is left out on purpose: libvips
  # needs an extra codec for it, and the shop can shoot JPEG instead.
  PHOTO_TYPES = %w[ image/jpeg image/png image/webp ].freeze
  MAX_PHOTO_SIZE = 5.megabytes

  has_many_attached :intake_photos do |attachable|
    attachable.variant :thumb,  resize_to_fill: [ 240, 180 ]
    attachable.variant :medium, resize_to_limit: [ 800, 800 ]
  end

  has_rich_text :diagnosis

  enum :state, {
    received:    "received",
    quoted:      "quoted",
    approved:    "approved",
    declined:    "declined",
    in_progress: "in_progress",
    ready:       "ready",
    collected:   "collected"
  }

  validates :state, :received_at, :promised_on, presence: true
  validate :dates_in_order
  validate :consistent_with_lifecycle
  validate :intake_photos_are_usable

  scope :in_shop,      -> { not_collected }
  scope :overdue,      -> { in_shop.where("repairs.promised_on < ?", Date.current) }
  scope :by_promise,   -> { order(:promised_on) }
  scope :newest_first, -> { order(received_at: :desc) }

  def overdue?
    promised_on < Date.current && !collected?
  end

  def total
    repair_services.sum(:charged_price)
  end

  private

  def dates_in_order
    return if received_at.blank?

    arrived = received_at.to_date

    if promised_on.present? && promised_on < arrived
      errors.add(:promised_on, "can't be before the day the bike came in")
    end

    if collected_at.present? && collected_at.to_date < arrived
      errors.add(:collected_at, "can't be before the day the bike came in")
    end
  end

  def consistent_with_lifecycle
    if collected_at.present? && !collected?
      errors.add(:collected_at, "must be empty until the bike is collected")
    end

    # A small job goes from received straight to in_progress without a quote,
    # so only the two states that ARE the customer's answer require it.
    if (approved? || declined?) && quote_answered_at.blank?
      errors.add(:quote_answered_at, "must be recorded before a repair is approved or declined")
    end
  end

  def intake_photos_are_usable
    intake_photos.each do |photo|
      blob = photo.blob

      unless PHOTO_TYPES.include?(blob.content_type)
        errors.add(:intake_photos, "#{blob.filename} is not a JPEG, PNG or WebP image")
      end

        if blob.byte_size > MAX_PHOTO_SIZE
          size  = (blob.byte_size / 1.megabyte.to_f).round(1)
          limit = MAX_PHOTO_SIZE / 1.megabyte
          errors.add(:intake_photos, "#{blob.filename} is #{size} MB, over the #{limit} MB limit")
        end
      end
    end
end
