require 'spec_helper'

describe "Viewing a list of reviews" do
 
  
  it "shows the reviews for a specific product" do
    user = User.create!(user_details)
    product = Product.create(product_details)
    sign_in_user(user)
    
    visit product_path(product)
    click_link 'Write review'

    select "2", from: "review_stars"
    fill_in "review_comment", with:"Could be better"
    click_button "Post Review"
        
    expect(page).to have_text("Could be better")
    expect(page).to have_text("2 out of 5")
  end
end