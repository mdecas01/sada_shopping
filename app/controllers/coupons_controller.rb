class CouponsController < ApplicationController
    
    before_action :allow_admin_user

    def index 
      @coupons = Coupon.all
    end
     	
	def new
      @coupon = Coupon.new
    end	

    def create
      @coupon = Coupon.new(coupons_params)
      @coupon.set_token
      @coupon.redeemed = false
      @coupon.set_expiring_date(params[:coupon].values[2])
      if @coupon.save
        redirect_to coupons_path
      else
        render :new
      end  
    end	

    def coupons_params
      params.require(:coupon).permit(:name, :discount)
  end	
end
