class FavoritesController < ApplicationController
  before_action :set_recipe

  def create
  end

  def destroy

end


  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  private

  def favorite_params
    params.require(:favorite).permit(:recipe_id, :user_id)
  end
end
