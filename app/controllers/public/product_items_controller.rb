class Public::ProductItemsController < ApplicationController
  
  def index
    @product_items = current_customer.product_items
    @total = @product_items.inject(0) { |sum, product_item| sum + product_item.subtotal }
  end 
  
  def creta
    @product_item = ProductItem.new(product_item_params)
    if current_customer.product_items.fidn_by(product_id: @product_item.product_id)
      product_item = current_customer.product_items.find_by(product_id: @product_item.product_id)
      product_item.quantity += @product_item.quantity.to_i
      product_item.save
      redirect_to product_items_path
    else 
      @product_item.save
      redirect_to product_items_path
    end 
  end 
  
  def update
    @product_item = ProductItem.find(params[:id])
    @product_item.update(prodcut_item_params)
    redirect_to product_items_path
  end 
  
  def destroy_all
    current_customer.product_items.destroy_all 
    redirect_to product_items_path
  end 
  
  private
  def product_item_params
    params.require(:product_item).permit(:customer_id, :product_id, :quantity)
  end 
  
end
