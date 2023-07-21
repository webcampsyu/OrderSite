class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :product
  
  #商品の合計金額
  def total_price
    subprice.to_i * quantity.to_i
  end 
  
end
