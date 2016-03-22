class ChangeCouponDiscountField < ActiveRecord::Migration
  def change
  	change_column :coupons, :discount,  :integer
  end
end
