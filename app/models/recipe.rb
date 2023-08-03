class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipes_foods, class_name: 'RecipesFoods'

  validates :name, presence: true

  def total_price
    Recipe.find(id)
    total = 0
    recipes_foods.each do |food|
      total = food.food.price
    end
    total
  end
end
