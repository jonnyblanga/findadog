class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :contact, :about]

  def home
    @dogs_rand = Dog.all.sample(6)
  end

  def about
  end

  def contact
  end

end
