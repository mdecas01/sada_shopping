class Coupon < ActiveRecord::Base

   validates :name,  presence: true
   validates :discount,  presence: true, numericality: { only_integer: true,  greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
   
	def set_token
      self.token = SecureRandom.hex.first(7).upcase
    end		

    def set_expiring_date(expire_days)
      self.expire = Time.now + (expire_days.to_i).days
    end	

    def redeemed?
      self.redeemed
    end  

    def redeem
      if self.redeemed == false
      	self.redeemed = true
      end
    end	
end
