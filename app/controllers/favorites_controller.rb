class FavoritesController < ApplicationController
  before_action :set_recipe
  before_action :set_variables

  def create
    @favorite = current_user.favorites.build(recipe_id: params[:recipe_id])

    respond_to do |format|
      if @favorite.save
        format.html { redirect_to @recipe, notice: 'Favorite was successfully created.' }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new }
        format.json { render json: @favorite.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    remove_favorite
  respond_to do |format|
    format.turbo_stream
    format.html { redirect_to recipes_url, notice: "Unfavorited!" }
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
    favorite.destroy if favorite.present?
end

  def set_variables
    @id_name = "#like-link-#{@recipe.id}"
  end

  def favorite_params
    params.require(:favorite).permit(:recipe_id, :user_id)
    # ここで許可するパラメーターは都度変更する可能性があります。
  end
end
