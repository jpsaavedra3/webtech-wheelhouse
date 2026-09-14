class Repair < ApplicationRecord
  belongs_to :bike
  belongs_to :received_by,       class_name: "User"
  belongs_to :quote_answered_by, class_name: "User", optional: true

  has_many :repair_services
end
