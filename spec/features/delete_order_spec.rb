require 'spec_helper'

  describe "Deleting orders" do
    
    it "shows a link to delete the order" do
      user = User.create!(user_details)
      admin = User.create!( name: "User2",
                            email: "user2@example.com",
                            password: "password2",
                            password_confirmation: "password2",
                            admin: true)
      order = Order.create!(address: "Some address", payment_type: "Check", user_id: user.id)
      sign_in_user(admin)
      click_link "Orders"

      expect(page).to have_link("Delete order")
    end

    it "removes the order from the list" do
      user = User.create!(user_details)
      admin = User.create!( name: "User2",
                            email: "user2@example.com",
                            password: "password2",
                            password_confirmation: "password2",
                            admin: true)
      order = Order.create!(address: "Some address", payment_type: "Check", user_id: user.id)
      sign_in_user(admin)
      click_link "Orders"
      click_link "Delete order"

      expect(page).not_to have_link("Delete order")
    end
  end