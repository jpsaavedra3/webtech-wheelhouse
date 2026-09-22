class Service < ApplicationRecord
  has_many :repair_services, dependent: :restrict_with_error
  has_many :repairs, through: :repair_services, dependent: :restrict_with_error

  before_validation :strip_name

  validates :name, presence: true, uniqueness: { message: "is already on the list" }
  validates :price, presence: true, numericality: { greater_than: 0 }

  scope :by_name, -> { order(:name) }

  private

  def strip_name
    self.name = name.strip if name
  end
end
