class AddFieldsToCoupons < ActiveRecord::Migration
  def change
    add_column :coupons, :name, :string
    add_column :coupons, :expire, :date
  end
end
