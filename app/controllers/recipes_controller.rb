class RecipesController < ApplicationController
  before_action :set_recipe, only: [:edit, :show, :destroy, :update]
  before_action :move_to_index, except: [:index, :show, :search]

  def index
    @recipes = Recipe.order(created_at: :desc)
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)
    if @recipe.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    recipe.destroy
    redirect_to root_path
  end

  def edit
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
    @comment = Comment.new
    @comments = @recipe.comments.includes(:user)
  end

  def search
    @recipes = Recipe.search(params[:keyword])
  end

  def like
    @recipe = Recipe.find(params[:id])
    if current_user.favorites.exists?(recipe: @recipe)
      current_user.favorites.find_by(recipe: @recipe).destroy
    else
      current_user.favorites.create(recipe: @recipe)
    end
    render json: { success: true, favorites_count: @recipe.favorites.count }
  end

  private
  def recipe_params
    params.require(:recipe).permit(:nickname, :recipe_image, :title, :material, :make).merge(user_id: current_user.id)
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
