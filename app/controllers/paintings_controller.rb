class PaintingsController < ApplicationController

  def index
    @paintings = Painting.all
  end

  def def new
    @painting = Painting.new
  end

  def create
    @painting = Painting.new(permit_params)
    @painting.save
    redirect_to @painting 
  end

  private
  
  def permit_params
    params.require(:painting).permit(:name)
  end
    
end
