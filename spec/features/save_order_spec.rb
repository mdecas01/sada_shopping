require 'spec_helper'

  describe "Clicking the checkout button" do

    before do
      @user = User.create!(user_details)
      sign_in_user(@user)
    end 
    
    it "shows a message confirming the order" do
      product = Product.create(product_details)

      visit product_url(product)

      click_button 'Add to cart'

      click_link 'Checkout'

      fill_in "Name", with: "Rodrigo"
      fill_in "Address", with: "Lucey way, London"
      fill_in "Email", with: "rodrigo@example.com"
      select "Check", from: "Payment type"

      click_button 'Create Order'

      expect(page).to have_text("Thanks for shopping with us!")
    end

    it "shows the dispatched value as NO" do
      product = Product.create(product_details)

      visit product_url(product)

      click_button 'Add to cart'

      click_link 'Checkout'

      fill_in "Name", with: "Rodrigo"
      fill_in "Address", with: "Lucey way, London"
      fill_in "Email", with: "rodrigo@example.com"
      select "Check", from: "Payment type"

      click_button 'Create Order'

      visit orders_url

      expect(page).to have_text("Dispatched: NO")
    end
  end