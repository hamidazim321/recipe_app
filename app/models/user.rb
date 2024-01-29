class User < ApplicationRecord
  has_many :recipe
  
  validates :name, presence: true, length: {maximum: 120}
end
