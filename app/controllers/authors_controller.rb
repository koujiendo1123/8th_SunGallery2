class AuthorsController < ApplicationController
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
    @author.update(permit_params)
    redirect_to @author    
  end
  
  private
  
  def permit_params
    params.require(:author).permit(:name, :authorable_type, :authorable_id)
  end
end
