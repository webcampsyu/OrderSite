class Public::ProductsController < ApplicationController
  
  def index
    @items = Item.all
    @genres = Genre.all
  end 
  
  def show
    @product = Product.find(params[:id])
    @genre = Genre.all
    @product_item = ProductItem.new
  end 
  
end
