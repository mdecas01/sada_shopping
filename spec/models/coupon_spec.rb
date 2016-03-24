
require 'spec_helper'

  describe "creating an coupon" do
  	it "has a name on it" do
      coupon = Coupon.create(coupon_details(name: "User2"))

      expect(coupon.name).to eq("User2")
  	end	
    
    it "has an expiring date" do
      coupon = Coupon.create(coupon_details(expire: Time.now + 20))
     
      expect(coupon.expire).to eq(Date.strptime(Time.now + 20, "%B %d, %Y"))
    end	
  end
