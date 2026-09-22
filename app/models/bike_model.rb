class BikeModel < ApplicationRecord
  has_many :bikes, dependent: :restrict_with_error

  validates :brand, :name, presence: true
end
