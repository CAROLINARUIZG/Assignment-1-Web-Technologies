class Location < ApplicationRecord
  has_many :events, dependent: :restrict_with_error

  validates :name, :address, presence: true
  validates :default_capacity, numericality: { only_integer: true, greater_than: 0 }, allow_nil: true
end