class AuthorsController < ApplicationController
  before_action :authenticate_general_user!
  before_action :authorize_special_user, only: [:new, :create, :edit, :update, :destroy]

  def index
    @authors = Author.all
  end

  def new
    @authork = Author.new
  end
  
  def create
    @authork = Author.new(permit_params)
    if @authork.save
      flash[:success] = "作者の作成に成功しました"
      redirect_to authors_path
    else
      flash[:error] = "作者の作成に失敗しました"
      render 'new', status: :unprocessable_entity
    end
  end

  def show
    @authork = Author.find(params[:id])    
  end

  def edit
    @authork = Author.find(params[:id])
  end
  
  def update
    @authork = Author.find(params[:id])
    if @authork.update(permit_params)
      redirect_to @authork, notice: "更新しました"
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @authork = Author.find(params[:id])
    @authork.destroy
    redirect_to authors_path, notice: "削除しました", status: :see_other
  end
  
  private

  def permit_params
    params.require(:author).permit(:name, :authorable_type, :authorable_id)
  end

  def authorize_special_user
    allowed_emails = ENV['ALLOWED_EMAILS'].split(',')
    unless allowed_emails.include?(current_general_user.email)
      redirect_to root_path, alert: 'このアカウントではアクセスできません'
    end
  end
end
