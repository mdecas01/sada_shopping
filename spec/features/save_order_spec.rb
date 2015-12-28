require 'spec_helper'

  describe "Clicking the checkout button" do
    
    it "shows a message confirming the order" do
      @product = Product.create(product_details)
      @user = User.create!(user_details)
      sign_in_user(@user)

      visit product_url(@product)

      click_button 'Add to cart'

      click_link 'Checkout'

      fill_in "Address", with: "Lucey way, London"
      select "Check", from: "Payment type"

      click_button 'Create Order'

      expect(page).to have_text("Thanks for shopping with us!")
    end
  end