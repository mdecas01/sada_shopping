class Product < ActiveRecord::Base
    #include Comparable

    validates :name, presence: true
    validates :description, length: { minimum: 10  }
    validates :price, numericality: { greater_than: 0}
    validates :quantity, numericality: { greater_than_or_equal_to: 0}
    validates :image_url, allow_blank: true, format: {
               with:    /\w+\.(gif|jpg|png)\z/i,
               message: "Only GIF, JPG, or PNG images are allowed"
              }        
    
    has_many :product_items
    has_many :reviews, dependent: :destroy
    has_many :categorization, dependent: :destroy
    has_many :categories, through: :categorization
    has_many :wishlists, dependent: :destroy
    has_many :customers, through: :wishlists, source: :user
    
    #checks if the product is related to any cart
    before_destroy :check_product_lines

	def available?
      quantity != nil && quantity > 0
	end	
    
    #if a product was posted less than 1 dat ago it is considered new
	def new?
      Time.now < created_at.to_time + (60 * 60 * 24)	
	end	

  def average_star_reviews
   total_stars = 0
   number_of_reviews = 0
   reviews.each do |review|
     #excludes the admin users from the counting
     if !review.user.admin
       total_stars = total_stars + review.stars
       number_of_reviews += 1
     end  
   end 
   if number_of_reviews > 0
     total_stars / number_of_reviews 
   else
     "No reviews"
   end  
 end

  private

  def check_product_lines
    if product_items.empty?
      true
    else
      errors.add(:base, 'A shopping cart has this product')
      false
    end
  end  

 def self.search(search)
   if search
     self.where("name like ?", "%#{search}%")
   else
     self.all
   end
 end 
end
