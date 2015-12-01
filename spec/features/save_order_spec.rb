require 'spec_helper'

  describe "Clicking the checkout button" do
    it "shows a message confirming the order" do
      product = Product.create(product_details)

      visit product_url(product)

      click_button 'Add to cart'

      click_button 'Checkout'

      fill_in "Name", with: "Rodrigo"
      fill_in "Address", with: "Lucey way, London"
      fill_in "Email", with: "rodrigo@example.com"
      select "Check", from: "Payment type"

      click_button 'Create Order'

      expect(page).to have_text("Thanks for shopping with us!")
    end
  end