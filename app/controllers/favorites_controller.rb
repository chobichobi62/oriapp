class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_recipe, only: [:create, :destroy]

  def create
    @favorite = current_user.favorites.build(recipe: @recipe)
  end
  
  private

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def favorite_params
    params.require(:favorite).permit(:recipe_id, :user_id)
  end
end
