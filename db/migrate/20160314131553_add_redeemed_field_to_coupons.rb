class AddRedeemedFieldToCoupons < ActiveRecord::Migration
  def change
    add_column :coupons, :redeemed, :boolean
  end
end
