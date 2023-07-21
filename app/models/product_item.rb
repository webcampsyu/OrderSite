class ProductItem < ApplicationRecord
  belongs_to :customer
  belongs_to :product
  
  validates :quantity, presence: true
  
  #商品毎の小計
  def subtotal
    product.tax_price * quantity
  end 
  
end
