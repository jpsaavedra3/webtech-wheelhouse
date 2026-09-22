class Bike < ApplicationRecord
  belongs_to :bike_model
  belongs_to :customer

  has_many :repairs, dependent: :restrict_with_error

  before_validation :normalize_serial_number

  validates :serial_number, uniqueness: { message: "is already registered" }, allow_nil: true

  scope :by_serial, -> { order(:serial_number) }

  private

  def normalize_serial_number
    return if serial_number.nil?

    self.serial_number = serial_number.strip.upcase
    self.serial_number = nil if serial_number.empty?
  end
end
