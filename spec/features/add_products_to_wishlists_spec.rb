require 'spec_helper'

describe "Adding a product to a wishlist" do
	it "creates a wishlist" do
      user = User.create!(user_details)
      product = Product.create!(product_details)
      sign_in_user(user)

      visit product_path(product)

      click_button 'Add to wishlist'

      expect(Wishlist.count).to eq(1)
	end	

	it "shows a confirmation message" do
      user = User.create!(user_details)
      product = Product.create!(product_details)
      sign_in_user(user)

      visit product_path(product)

      click_button 'Add to wishlist'

      expect(page).to have_text("Product was added to your wishlist!")
	end	
end

describe "Deleting a wishlist" do

   it "removes the wishlist from the database" do
      user = User.create!(user_details)
      product = Product.create!(product_details)
      sign_in_user(user)

      visit product_path(product)

      click_button 'Add to wishlist'
      click_button 'Remove from wishlist'


      expect(Wishlist.count).to eq(0)
    end  
end
