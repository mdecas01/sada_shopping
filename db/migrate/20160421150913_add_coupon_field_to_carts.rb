class AddCouponFieldToCarts < ActiveRecord::Migration
  def change
    add_column :carts, :coupon, :string
  end
end
