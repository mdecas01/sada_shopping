require 'spec_helper'

describe "viewing a wishlist page" do	

  it "shows the products in the wishlist" do
    user = User.new(user_details)
    product = Product.new(product_details)
    wishlist = Wishlist.new(user_id: user.id, product_id: product.id)

    visit products_path
    click_button 'My wishlist'

    expect(page).to have_link(product.name)
  end	
end