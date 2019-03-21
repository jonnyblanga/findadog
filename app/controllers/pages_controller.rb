class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :contact, :about]

  def home
  end

  def about
  end

  def contact
  end

end
