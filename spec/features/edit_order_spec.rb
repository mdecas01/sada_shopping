require 'spec_helper'

  describe "Editing orders" do
    
    it "changes the order status" do
      user = User.create!(user_details)
      admin = User.create!( name: "User2",
                            email: "user2@example.com",
                            password: "password2",
                            password_confirmation: "password2",
                            admin: true)
      order = Order.create!(address: "Some address", payment_type: "Check", user_id: user.id)
      sign_in_user(admin)
      click_link "Orders"

      click_link "Edit order"

      select "YES", from: "order_dispatched"
      click_button "Update Order"

      expect(page).to have_text("Dispatched: YES")
    end

  end