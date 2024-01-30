class Recipe < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, length: { maximum: 250 }
  validates :preparation_time, presence: true, numericality: { less_than_or_equal_to: 100 }
  validates :cooking_time, presence: true, numericality: { less_than_or_equal_to: 100 }
  validates :description, presence: true
end
