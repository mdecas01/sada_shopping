class AddOrderIdToProductItem < ActiveRecord::Migration
  def change
    add_reference :product_items, :order, index: true
  end
end
