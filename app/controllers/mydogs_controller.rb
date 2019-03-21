class MydogsController < ApplicationController
  before_action :find_favorite, only: [:destroy]

  def index
    @user = current_user
    @favorites = Favorite.where(user: current_user).all if current_user.role == "user"
    @dogs = Dog.where(user: current_user).all if current_user.role == "shelter"
  end

  def create
    @favorite = Favorite.new(user: current_user, dog_id: params[:dog_id])
    @favorite.save
    redirect_to dogs_path
  end

  def destroy
    @favorite.destroy
    redirect_to dogs_path
  end

  private

  def favorite_params
    params.require(:favorite).permit(:user, :dog, :id)
  end

  def find_favorite
    @favorite = Favorite.find(params[:id])
  end
end
