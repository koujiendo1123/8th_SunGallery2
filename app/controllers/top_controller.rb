class TopController < ApplicationController
  def index
    @paintings = Painting.all
  end
  
end
