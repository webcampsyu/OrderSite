class Product < ApplicationRecord
  has_one_attached :image
  
  enum sells_status: { sold_out: false, sale: true }
  
  belongs_to :genre
  has_many :product_items, dependent: :destroy
  has_many :order_details, dependent: :destroy
  
  validates :name, presence: true
  validates :image, presence: true
  validates :explanation, presence: true
  validates :genre_id, presence: true
  
  #税込金額
  def tax_price
    (price * 1.1).floor
  end 
  
  def get_image(width, height)
    image.variant(resize_to_limit: [width, height]).processed
  end 
  
end
