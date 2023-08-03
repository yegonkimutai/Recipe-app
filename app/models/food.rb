class Food < ApplicationRecord
  belongs_to :user
  has_many :recipes_foods, class_name: 'RecipesFoods'

  validates :name, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :quantity, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
