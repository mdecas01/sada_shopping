require 'spec_helper'

  describe "Listing orders" do
    
    it "shows the list f orders made by users" do
      user = User.create!(user_details)
      admin = User.create!( name: "User2",
                            email: "user2@example.com",
                            password: "password2",
                            password_confirmation: "password2",
                            admin: true)
      order = Order.create!(address: "Some address", payment_type: "Check", user_id: user.id)
      sign_in_user(admin)
      click_link "Orders"

      expect(page).to have_text("Order for user User1")
    end
  end