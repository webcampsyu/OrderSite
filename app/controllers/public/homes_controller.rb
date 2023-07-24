class Public::HomesController < ApplicationController
  
  def top
    @products = Product.order("id DESC").limit(4)
    @genres = Genre.all
  end 
  
  def index
    if params[:id]
      @genres = Genre.all
      @genre = Genre.find(params[:id])
      @products = @genre.products.where(params[:id])
    else
      @products = Product.all
      reder :top
    end 
  end 
  
  
end
