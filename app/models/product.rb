class Product < ApplicationRecord
  belongs_to :warehouse

  validates :name, :price, :color, :description, presence: true
  validates :name, uniqueness: true
  validates :price, numericality: { only_integer: true}, length: { maximum: 7}

  COLOR = %w{ Black White Navy Blue Red Satin Yellow Seaform Burgundy Teal Khaki}
end
