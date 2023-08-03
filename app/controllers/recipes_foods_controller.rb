class RecipesFoodsController < ApplicationController
  def new
    @recipe_name = Recipe.find(params[:recipe_id]).name
    @recipes_foods = RecipesFoods.new
  end

  def create
    @recipes_foods = RecipesFoods.new(recipes_foods_params)
    @recipes_foods.recipe_id = params[:recipe_id]

    if @recipes_foods.save
      redirect_to "/recipes/#{params[:recipe_id]}"
    else
      render :new, status: 422
    end
  end

  def destroy
    @recipe = RecipesFoods.find_by(food_id: params[:id], recipe_id: params[:recipe_id])
    if @recipe.destroy
      redirect_to(request.referrer || root_path)
    else
      flash[:error] = 'error'
    end
  end

  private

  def recipes_foods_params
    params.require(:recipes_foods).permit(:food_id, :quantity)
  end
end
