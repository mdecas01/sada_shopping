require 'spec_helper'

  describe "Listing orders" do
    
    it "shows the list of orders made by all users" do
      user = User.create!(user_details)
      user2 = User.create!(user_details(name: "User2", email: "user2@example.com"))
      admin = User.create!( name: "admin_user",
                            email: "user3@example.com",
                            password: "password2",
                            password_confirmation: "password2",
                            admin: true)
      order = Order.create!(address: "Some address", payment_type: "Check", user_id: user.id)
      order = Order.create!(address: "Some address", payment_type: "Check", user_id: user2.id)
      sign_in_user(admin)
      click_link "Orders"

      expect(page).to have_text("Order for user User1")
      expect(page).to have_text("Order for user User2")
    end

    it "shows the list of orders made by a specific user users" do
      user = User.create!(user_details)
      user2 = User.create!(user_details(name: "User2", email: "user2@example.com"))
      order = Order.create!(address: "Some address", payment_type: "Check", user_id: user.id)
      order = Order.create!(address: "Some address", payment_type: "Check", user_id: user2.id)
      sign_in_user(user)
      click_link "My orders"

      expect(page).to have_text("Order for user User1")
      expect(page).not_to have_text("Order for user User2")
    end
  end