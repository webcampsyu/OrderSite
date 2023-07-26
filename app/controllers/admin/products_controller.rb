class Admin::ProductsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @products = Product.all
  end 
  
  def new
    @product = Product.new
  end 
  
  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "商品を登録しました"
      redirect_to admin_products_path
    else 
      flash.now[:alert] = "商品の登録に失敗しました"
      render :new
    end 
  end 
  
  def show
    @product = Product.find(params[:id])
  end 
  
  def edit
    @product = Product.find(params[:id])
  end 
  
  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:notice] = "商品を編集しました"
      redirect_to admin_products_path
    else 
      flash.now[:alert] = "商品の編集に失敗しました"
      render :edit
    end 
  end 
  
    
    private
    
    def product_params
      params.require(:product).permit(:name, :explanation, :size, :image, :genre_id, :price, :sells_status)
    end 
end 
  
  
