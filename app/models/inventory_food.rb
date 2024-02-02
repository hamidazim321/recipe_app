class InventoryFood < ApplicationRecord
  belongs_to :inventory
  belongs_to :food
  accepts_nested_attributes_for :food

  validates :quantity, numericality: { greater_than_or_equal_to: 1 }
end
