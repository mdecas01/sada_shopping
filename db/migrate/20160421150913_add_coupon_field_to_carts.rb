class AddCouponFieldToCarts < ActiveRecord::Migration
  def change
    add_column :carts, :coupon, :coupon
  end
end
