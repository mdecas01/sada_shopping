class Coupon < ActiveRecord::Base

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
