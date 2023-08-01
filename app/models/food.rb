class Food < ApplicationRecord
  belongs_to :user
  has_many :recipies_foods

  validates :name, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :quantity, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
