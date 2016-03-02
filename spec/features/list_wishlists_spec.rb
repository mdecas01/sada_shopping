require 'spec_helper'

describe "viewing the wishlists page" do

  it "shows a search box" do
    visit wishlists_path

    expect(page).to have_button "Search"
  end	

  it "shows the wishlist related to the search" do
    user = User.new(user_details)
    product = Product.new(product_details)
    wishlist = Wishlist.new(user_id: user.id, product_id: product.id)

    visit wishlists_path
    fill_in "search", with: "#{user.name}"
    click_button "Search"

    expect(page).to have_link(user.name)
  end	
end
