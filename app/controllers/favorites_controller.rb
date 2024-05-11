class FavoritesController < ApplicationController
  before_action :set_recipe
  before_action :set_variables

  def create
    add_favorite
    respond_to do |format|
      format.turbo_stream { redirect_to @recipe }
      format.js
    end
  end

  def destroy
    remove_favorite
  respond_to do |format|
    format.turbo_stream { redirect_to @recipe }
    format.js
    end
  end

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  private

  def add_favorite
    favorite = current_user.favorites.build(recipe_id: params[:recipe_id])
    favorite.save
  end

  def remove_favorite
  favorite = Favorite.find_by(recipe_id: params[:recipe_id], user_id: current_user.id)
  favorite.destroy
end

  def set_variables
    @id_name = "#like-link-#{@recipe.id}"
  end
end
