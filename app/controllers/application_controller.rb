class ApplicationController < ActionController::Base
  # gem deviseを導入するために下記を記載
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # gem deviseを導入するために下記を記載
  def configure_permitted_parameters
    # ユーザー登録時にname,email,password,password_confirmationのストロングパラメータを追加。通常パスワードは不要なはずだが、エラーが出たので追加。
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :password_confirmation])
    # ユーザー編集時にnameのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:account_update, keys: [:name,:password])
  end

  private
  # 必要ない気がしたのでコメントアウト
  # def default_url_options
  #   if Rails.env.production?
  #     { host: 'www.8th-sungallery.com' }
  #   else
  #     { host: 'localhost', port: 3001 }
  #   end
  # end
end
