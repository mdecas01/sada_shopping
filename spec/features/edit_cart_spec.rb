require 'spec_helper'

  describe "Editing a cart" do
    
    it "changes the quantity of each product" do
      product = Product.create!(product_details)
      user = User.create!(user_details)
      sign_in_user(user)

      visit product_url(product)
      click_button "Add to cart"
      click_link "Edit cart"

      select "2", from: "quantity"
      click_button "Update item"

      expect(page).to have_text("2x Folding chair")
    end
  end