class FavoritesController < ApplicationController
  before_action :set_recipe
  before_action :set_variables

  def create
    favorite = current_user.favorites.build(recipe_id: params[:recipe_id])
    favorite.save
    respond_to do |format|
      format.js
    end
  end

  def destroy
    favorite = Favorite.find_by(recipe_id: params[:recipe_id], user_id: current_user.id)
    favorite.destroy
    respond_to do |format|
      format.js
    end
  end

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def favorite
    favorite = current_user.favorites.new(recipe_id: @recipe.id)
    favorite.save
  end

  def favorite
    favorite = current_user.favorites.find_by(recipe_id: @recipe.id)
    favorite.destroy
  end

  private
  def set_variables
    @recipe = Recipe.find(params[:recipe_id])
    @id_name = "#like-link-#{@recipe.id}"
  end
end
