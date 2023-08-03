class ShoppingListController < ApplicationController
  def index
    @recipes = current_user.recipes.includes(recipes_foods: :food)
    @all_recipes_foods = @recipes.map(&:recipes_foods).flatten

    @recipes_foods = @all_recipes_foods.select { |recipe| recipe.quantity > recipe.food.quantity }
  end
end
