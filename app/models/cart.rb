class Cart < ActiveRecord::Base

  has_many :product_items, dependent: :destroy	
  belongs_to :user
end
