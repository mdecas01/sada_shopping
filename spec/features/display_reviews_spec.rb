require 'spec_helper'

describe "Viewing a list of reviews" do
 
  
  it "shows the reviews for a specific product" do
    @user = User.create!(user_details(admin: true))
    sign_in_user(@user)

    @product1 = Product.create!(product_details)
    @review1 = @product1.reviews.create!(review_details)
    @review2 = @product1.reviews.create!(review_details(stars: 2, comment: "Could be better!"))

    @product2 = Product.create!(product_details(name: "Folding chair 2"))
    @review3 = @product2.reviews.create!(review_details(stars: 4, comment: "Better than the previous!"))
    
    visit product_reviews_url(@product1)
        
    expect(page).to have_text(@review1.comment)
    expect(page).to have_text(@review2.comment)
    expect(page).not_to have_text(@review3.comment)
  end
end