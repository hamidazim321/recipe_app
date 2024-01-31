class InventoryFood < ApplicationRecord
  belongs_to :inventory

  validates :quantity, numericality: { greater_than_or_equal_to: 1 }
  validates :inventory_id, presence: true
end