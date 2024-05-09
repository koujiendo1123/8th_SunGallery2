class AuthorsController < ApplicationController
  def index
    @authors = Author.all
  end

  def def new
    @author = Author.new
  end
  
  def def create
    @author = Author.new(params[:object])
    if @author.save
      flash[:success] = "Object successfully created"
      redirect_to @author
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end
  
  private
  
  def permit_params
    params.require(:author).permit(:name)
  end

end
