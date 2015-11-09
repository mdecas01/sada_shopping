class Product < ActiveRecord::Base
    include Comparable

	def available?
      quantity != nil && quantity > 0
	end	
    
    #if a product was posted less than 1 dat ago it is considered new
	def new?
      Time.now < created_at.to_time + (60 * 60 * 24)	
	end	
end
