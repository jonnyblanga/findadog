class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!, :except => [:index]

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    added_attrs = [:name, :address, :username, :email, :password, :password_confirmation, :remember_me, :phone, :role]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  def after_sign_in_path_for(user)
    if user.role == 'shelter'
      mydogs_path
    else
      root_path
    end
  end

  def default_url_options
    { host: ENV["HOST"] || "localhost:3000" }
  end
end
