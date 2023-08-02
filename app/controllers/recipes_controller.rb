class RecipesController < ApplicationController
    before_action :set_recipe, only: %i[show edit update destroy]
    before_action :authenticate_user!

    def index
        @recipes = Recipe.all
    end

    def new
        @recipe = Recipe.new
    end

    def show
        @recipe = Recipe.find(params[:id])
    end

    def create
        @recipe = Recipe.new(recipe_params)

        if @recipe.save
            redirect_to recipes_path
        else
            render :new
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

    private

    def set_recipe
        @recipe = Recipe.find_by(id: params[:id])
    end

    def recipe_params
        params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description)
    end
end
