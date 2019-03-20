class MydogsController < ApplicationController

  def index
    @user = current_user
    @favorites = Favorite.where(user: current_user).all if current_user.role == "user"
    @dogs = Dog.where(user: current_user).all if current_user.role == "shelter"

  end

end
