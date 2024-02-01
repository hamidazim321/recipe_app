class Food < ApplicationRecord
  has_many :inventory_foods, dependent: :destroy
  has_many :inventory, through: :inventory_foods
  has_many :recipe_foods, dependent: :destroy
  has_many :recipes, through: :recipe_foods

  validates :measurement_unit, presence: true, inclusion: { in: %w[g mg kg], message: '%<value>s is not a valid unit' }
  validates :name, presence: true, length: { maximum: 120 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
