# frozen_string_literal: true

class GeneralUsers::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
   def new
     @generaluser = GeneralUser.new
     super
   end

  # POST /resource/sign_in
   def create
     super
   end

  # DELETE /resource/sign_out
   def destroy
    sign_out current_general_user
    redirect_to root_path, status: :see_other, notice: 'ログアウトしました'
   end

  #  protected

  #  # If you have extra params to permit, append them to the sanitizer.
  #  def configure_sign_in_params
  #    devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  #  end
end
