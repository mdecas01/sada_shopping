require 'spec_helper'

describe "Viewing the product's page" do

  it "shows the product details" do

   product = Product.create(product_details)

   visit products_url

   click_link(product.name)

    expect(page).to have_text(product.name)
    expect(page).to have_text(product.description)
    expect(page).to have_text("£20.99")
    expect(page).to have_selector("img[src$='#{product.image_url}']")
  end	

  it "shows the list of users who added product to wishlist" do
    admin = User.create!( name: "User2",
                            email: "user2@example.com",
                            password: "password2",
                            password_confirmation: "password2",
                            admin: true)

    product = Product.create(product_details)
    user = User.create!(user_details)
    wishlist = Wishlist.create!(user_id: user.id, product_id: product.id)
    sign_in_user(admin)
    visit product_path(product)

    expect(page).to have_text("1 customer added this product to their wishlist") 
  end	
  

end