class FavoritesController < ApplicationController
  before_action :set_recipe
  before_action :authenticate_user!


  def create
    @favorite = current_user.favorites.build(recipe: @recipe)
  end

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  private

  def favorite_params
    params.require(:favorite).permit(:recipe_id, :user_id)
  end
end
