class SiteName < ApplicationRecord
  belongs_to :customer
  
  validates :name, presence: true
  validates :address, presence: true
  
end
