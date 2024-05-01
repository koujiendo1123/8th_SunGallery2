class PaintingsController < ApplicationController

  def index
    @paintings = Painting.all
  end

  def show
    @painting = Painting.find(params[:id])
  end
  

  def new
    @painting = Painting.new
  end

  def create
    @painting = Painting.new(permit_params)
    if @painting.save
      flash[:success] = "Object successfully created"
    redirect_to @painting 
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  private
  
  def permit_params
    params.require(:painting).permit(:name, :author_id)
  end
    
end
