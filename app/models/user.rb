class User < ApplicationRecord
  has_many :received_repairs, class_name: "Repair", foreign_key: "received_by_id", dependent: :restrict_with_error
  has_many :answered_quotes,  class_name: "Repair", foreign_key: "quote_answered_by_id", dependent: :nullify
  has_many :repair_services,  foreign_key: "mechanic_id", dependent: :nullify

  validates :name, :role, presence: true

  scope :by_name, -> { order(:name) }
end
