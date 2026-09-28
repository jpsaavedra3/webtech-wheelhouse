class BikeModel < ApplicationRecord
  has_many :bikes, dependent: :restrict_with_error

  validates :brand, :name, presence: true

  scope :by_name, -> { order(:brand, :name) }
end
