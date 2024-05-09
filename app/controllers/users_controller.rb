class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @nickname = current_user.nickname
    @recipes = current_user.recipes
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    end
  end

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation, :profile, :profile_image)
  end

  def likes
    # likesアクションで行いたい処理をここに記述します
  end
end