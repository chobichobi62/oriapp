class FavoritesController < ApplicationController
  before_action :set_recipe
  before_action :authenticate_user!

  def create
    @favorite = current_user.favorites.new(recipe: @recipe)

    if @favorite.save
      render json: { success: true, favorites_count: @recipe.favorites.count }
    else
      render json: { success: false }
    end
  end

  def destroy
    @favorite = current_user.favorites.find_by(recipe: @recipe)

    if @favorite&.destroy
      render json: { success: true, favorites_count: @recipe.favorites.count }
    else
      render json: { success: false }
    end
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def favorite_params
    params.require(:favorite).permit(:recipe_id, :user_id)
  end
end
