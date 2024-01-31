class Inventory < ApplicationRecord
  belongs_to :user
  validates :name, presence: true

  #has_many :inventory_foods
  validates :description, presence: true, length: { maximum: 250 }
end
