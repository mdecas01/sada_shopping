class RemoveCouponFieldFromCarts < ActiveRecord::Migration
  def change
  	remove_column :carts, :coupon, :string
  end
end
