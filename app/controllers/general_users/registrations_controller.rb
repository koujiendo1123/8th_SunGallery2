# frozen_string_literal: true

class GeneralUsers::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
      @generaluser = GeneralUser.new
     super
  end

  # POST /resource
   def create
     super
   end

  # GET /resource/edit
  def edit
    @generaluser = current_general_user
    super
  end

  # PUT /resource
  def update
     @generaluser = current_general_user
  if @generaluser.update_without_password(account_update_params)
    redirect_to after_update_path_for(@generaluser), notice: 'プロフィールが更新されました。'
    return # ここでアクションを終了させる
  else
    render :edit
    return # render後にアクションを終了させる
  end
    super 
    # この行は実際には到達しないが、独自の更新処理が不要な場合にDeviseのデフォルトの処理を利用するために残しておく
  end

  # DELETE /resource
  def destroy
    super
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  def cancel
    super
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    super(resource)
  end

  # The path used after sign up for inactive accounts.
  def after_inactive_sign_up_path_for(resource)
    super(resource)
  end

  # 下記でパスワードなしでデータをアップデートできるようにする。デフォルトだとできない
  def update_resource(resource, params)
    resource.update_without_password(params)
  end
  # プロフィール編集後にトップページでなく、プロフィール画面に飛ぶようにする。
  def after_update_path_for(resource)
    # 自分で設定した「マイページ」へのパス
    general_users_profile_path
  end
  # アップデートを実施するときのストロングパラーメータ用メソッド
  def account_update_params
    params.require(:general_user).permit(:name)
  end
end
