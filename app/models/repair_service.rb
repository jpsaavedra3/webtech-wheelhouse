class RepairService < ApplicationRecord
  belongs_to :repair
  belongs_to :service
  belongs_to :mechanic, class_name: "User", optional: true
end
