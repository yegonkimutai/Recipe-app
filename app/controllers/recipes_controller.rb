class RecipesController < ApplicationController
  before_action :authenticate_user!

  def index
    @recipes = Recipe.includes([:user]).where(user_id: current_user.id)
  end

  def show
    @recipe = Recipe.find(params[:id])
    @user = @recipe.user
    @foods = Food.joins(:recipes_foods).where(recipes_foods: { recipe_id: @recipe.id }).includes([:recipes_foods])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id

    if @recipe.save
      redirect_to recipes_path
    else
      render :new, status: 422
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])

    if @recipe.destroy
      redirect_to recipes_path, notice: 'Recipe was successfully deleted.'
    else
      redirect_to recipes_path, alert: 'There was an error deleting the Recipe.'
    end
  end

  def public_recipes
    @public_recipes = Recipe.includes(:user, :recipes_foods).where(public: true).order(created_at: :desc)
  end

  def toggle_public
    @recipe = Recipe.find(params[:id])
    @recipe.update(public: !@recipe.public)
    redirect_to @recipe
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation, :cooking, :desc, :public)
  end
end
