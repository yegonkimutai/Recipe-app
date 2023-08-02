class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipes_foods, class_name: 'RecipesFoods'

  validates :name, presence: true
end
