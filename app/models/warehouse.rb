class Warehouse < ApplicationRecord
  has_many :product

  validates :name, :location, presence: true
end
