class PaintingsController < ApplicationController
  before_action :set_painting, only: [:show, :edit, :update, :destroy, :print_images]
  before_action :authenticate_general_user!
  before_action :authorize_special_user, only: [:new, :create, :edit, :update, :destroy]

  def index
    @paintings = Painting.includes(:author, images_attachments: :blob).all
  end

  def show; end

  def new
    @painting = Painting.new
  end

  def create
    @painting = Painting.new(permit_params)
    Rails.logger.debug @painting.images.attached? # デバッグ情報を出力
    if @painting.save
      flash[:success] = "絵画を登録しました"
      redirect_to @painting 
    else
      flash[:error] = "絵画を登録できませんでした"
      render 'new'
    end
  end

  def update
    if @painting.update(permit_params)
      redirect_to painting_path, notice: "更新しました"
    else
      render "edit", status: :unprocessable_entity
    end
  end

  def destroy
    @painting.destroy
    redirect_to paintings_path, notice: "削除しました", status: :see_other
  end

  def print_images
    @painting = Painting.find(params[:id])
  end

  private
  
  def set_painting
    @painting = Painting.find(params[:id])
  end

  def permit_params
    params.require(:painting).permit(:name, :author_id, images: []).tap do |permitted_params|
      permitted_params[:images] = permitted_params[:images].reject(&:blank?)
    end
  end

  def authorize_special_user
    allowed_emails = ENV['ALLOWED_EMAILS'].split(',')
    unless allowed_emails.include?(current_general_user.email)
      redirect_to root_path, alert: 'このアカウントではアクセスできません'
    end
  end
end
