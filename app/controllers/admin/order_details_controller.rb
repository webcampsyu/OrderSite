class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!
  
  def show
    @order = Order.find(params[:id])
    @order_detail = OrderDetail.find(params[:id])
    @order_details = @order.order_details.all
  end 
  
end
