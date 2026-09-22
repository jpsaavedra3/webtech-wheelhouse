class RepairService < ApplicationRecord
  belongs_to :repair
  belongs_to :service
  belongs_to :mechanic, class_name: "User", optional: true

  validates :charged_price, presence: true, numericality: { greater_than: 0 }

  scope :in_order_added, -> { order(:created_at) }
  scope :newest_first,   -> { order(created_at: :desc) }
end
