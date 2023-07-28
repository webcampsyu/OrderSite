class Public::OrdersController < ApplicationController
  
  def new
    @product_items = current_customer.product_items
    if @product_items.any?
      @order = Order.new
      @site_names = current_customer.site_names
    else 
      redirect_to product_items_path
    end 
  end 
  
  def create
    @order = Order.new(order_params)
    if @order.save
      current_customer.product_items.each do |product_item|
        order_detail = OrderDetail.new()
        order_detail.order_id = @order.id
        order_detail.product_id = product_item.product.id
        order_detail.quantity = product_item.quantity
        order_detail.subprice = product_item.product_tax_price
        order_detail.save
      end 
      current_customer.product_items.destroy_all 
      redirect_to thanks_orders_path
    end 
  end 
  
  def confirm
    @order = Order.new(order_params)
  
    if params[:order][:site_name_option] == "0"
      ship = SiteName.find(params[:order][:site_name_id])
      if current_customer.site_names.exists?
        @order.site_name = ship.site_name
        @order.address = ship.address
        @order.name = ship.name
      end
    elsif params[:order][:site_name_option] == "1"
      @order.address = params[:order][:site_name]
      @order.site_name = params[:order][:site_name]
    else
      render 'new'
    end
  
    @product_items = current_customer.product_items.all
    @order.customer_id = current_customer.id
  end

  
  def thanks
  end 
  
  def index
    @orders = current_customer.orders
  end 
  
  def show
    @order = Order.find(params[:id])
    @total = @order.order_details.inject(0) { |sum, order_detail| sum + order_detail.total_price }
  end 
  
  private
  def order_params
    params.require(:order).permit(:site_name, :address, :customer_id)
  end
  
end
