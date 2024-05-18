class FavoritesController < ApplicationController
  before_action :set_recipe
  before_action :authenticate_user!


  def create
    @favorite = current_user.favorites.build(recipe: @recipe)

    if @favorite.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to @recipe, notice: 'Recipe was successfully favorited.' }
      end
    else
      respond_to do |format|
        format.html { redirect_to @recipe, alert: 'Unable to favorite recipe.' }
      end
    end
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @favorite = current_user.favorites.find_by(recipe: @recipe)
    if @favorite.destroy
      redirect_to @recipe, notice: 'Recipe was successfully unfavorited.'
    else
      redirect_to @recipe, alert: 'Unable to unfavorite recipe.'
    end
end


  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  private

  def favorite_params
    params.require(:favorite).permit(:recipe_id, :user_id)
  end
end
