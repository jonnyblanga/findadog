class MydogsController < ApplicationController

  def index
    @favorites = Favorite.where(user: current_user) if current_user.role == "user"
  end

end
