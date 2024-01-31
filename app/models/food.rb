class Food < ApplicationRecord
  has_many :inventory_foods, dependent: :destroy
  has_many :inventory, through: :inventory_foods

  validates :measurement_unit, presence: true, inclusion: { in: %w[g mg kg], message: '%<value>s is not a valid unit' }
  validates :name, presence: true, length: { maximum: 120 }
  validates :price, presence: true
end
