require 'spec_helper'


describe "creating a coupon" do

   it "is not possible if fields are empty" do
     user_admin = User.create!(admin_user_details)
     sign_in_user(user_admin)
     
     visit products_path

     click_link 'Create coupon'
     click_button 'Create Coupon'
     expect(page).to have_text("errors")
   end	

   it "is not possible if discount is not an integer" do
     user_admin = User.create!(admin_user_details)
     sign_in_user(user_admin)
     
     visit products_path
     
     click_link 'Create coupon'

     fill_in :coupon_discount, with: "some value"

     click_button 'Create Coupon'
     expect(page).to have_text("errors")
   end	

   it "is not possible if discount is bigger than 100" do
     user_admin = User.create!(admin_user_details)
     sign_in_user(user_admin)
     
     visit products_path
     
     click_link 'Create coupon'

     fill_in :coupon_discount, with: 101

     click_button 'Create Coupon'
     expect(page).to have_text("errors")
   end	
   
end