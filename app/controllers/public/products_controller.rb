class Public::ProductsController < ApplicationController
  
  def index
    @products = Product.all
    @genres = Genre.all
  end 
  
  def show
    @product = Product.find(params[:id])
    @genre = Genre.all
    @product_item = ProductItem.new
  end 
  
end
