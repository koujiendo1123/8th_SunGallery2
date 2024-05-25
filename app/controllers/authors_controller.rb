class AuthorsController < ApplicationController
  before_action :authenticate_general_user!
  before_action :authorize_special_user, only: [:new, :create, :edit, :update, :destroy]

  def index
    @authors = Author.all
  end

  def new
    @author = Author.new
  end
  
  def create
    @author = Author.new(permit_params)
    if @author.save
      flash[:success] = "作者の作成に成功しました"
      redirect_to authors_path
    else
      flash[:error] = "作者の作成に失敗しました"
      render 'new', status: :unprocessable_entity
    end
  end

  def show
    @author = Author.find(params[:id])
  end

  def edit
    @author = Author.find(params[:id])
  end
  
  def update
    @author = Author.find(params[:id])
    if @author.update(permit_params)
      redirect_to @author, notice: "更新しました"
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @author = Author.find(params[:id])
    @author.destroy
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
