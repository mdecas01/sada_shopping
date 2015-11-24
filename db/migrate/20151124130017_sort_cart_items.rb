class SortCartItems < ActiveRecord::Migration
  def up
    Cart.all.each do |cart|
      # gets the quantity of each individual item in the cart
      quantities = cart.product_items.group(:product_id).sum(:quantity)
      quantities.each do |product_id, quantity|
        if quantity > 1
          # remove individual items
          cart.product_items.where(product_id: product_id).delete_all
          # replace with a single item
          product = cart.product_items.build(product_id: product_id)
          product.quantity = quantity
          product.save!
        end
      end
    end
  end

  def down
    # split items with quantity>1 into multiple items
    ProductItem.where("quantity>1").each do |product_item|
      # add individual items
      product_item.quantity.times do
        ProductItem.create cart_id: product_item.cart_id,
        product_id: product_item.product_id, quantity: 1
      end
      # remove original item
      product_item.destroy
    end
  end	
end
