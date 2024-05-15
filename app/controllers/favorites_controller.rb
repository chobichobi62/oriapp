class FavoritesController < ApplicationController
  before_action :set_recipe
  before_action :authenticate_user!


  def create
    @recipe = Recipe.find(params[:recipe_id])
    current_user.favorite_recipes << @recipe
    redirect_to @recipe, notice: 'お気に入りに登録しました。'
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    current_user.favorite_recipes.delete(@recipe)
    redirect_to @recipe, notice: 'お気に入りを解除しました。'
end


  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  private

  def favorite_params
    params.require(:favorite).permit(:recipe_id, :user_id)
  end
end
