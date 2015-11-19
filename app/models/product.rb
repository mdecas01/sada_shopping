class Product < ActiveRecord::Base
    #include Comparable

    validates :name, :price, presence: true
    validates :description, length: { minimum: 10 }
    validates :price, numericality: { greater_than: 0}
    validates :quantity, numericality: { greater_than_or_equal_to: 0}
    validates :image_url, allow_blank: true, format: {
               with:    /\w+\.(gif|jpg|png)\z/i,
               message: "Only GIF, JPG, or PNG images are allowed"
              }
    
    has_many :product_items

    before_destroy :check_product_lines

	def available?
      quantity != nil && quantity > 0
	end	
    
    #if a product was posted less than 1 dat ago it is considered new
	def new?
      Time.now < created_at.to_time + (60 * 60 * 24)	
	end	

  private

  def check_product_lines
    if product_lines.empty?
      true
    else
      errors.add(:base, 'A shopping cart has this product')
      false
    end
  end  
end
