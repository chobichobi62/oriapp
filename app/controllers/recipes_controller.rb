class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end
  def new
    @recipe = Recipe.new
  end
  def create
    Recipe.create(recipe_params)
    redirect_to '/'
  end

  private
  def recipe_params
    params.require(:recipe).permit(:nickname, :image, :title, :material, :make)
  end
end
