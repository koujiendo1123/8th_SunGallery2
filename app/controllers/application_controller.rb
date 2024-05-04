class ApplicationController < ActionController::Base
  # gem deviseを導入するために下記を記載
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # gem deviseを導入するために下記を記載
  def configure_permitted_parameters
    # /users/sign_up
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :password_confirmation])
  end
end
