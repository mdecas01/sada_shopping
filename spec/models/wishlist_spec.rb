require 'spec_helper'

describe Wishlist do
  it "has a user" do
    user = User.new(user_details)
    wishlist = Wishlist.new(user_id: user.id)

    expect(wishlist.user).to  eq(user.id)
  end

  it "has a product" do
    product = Product.new(product_details)
    wishlist = Wishlist.new(product_id: product.id)

    expect(wishlist.product).to  eq(product.id)
  end	
end
