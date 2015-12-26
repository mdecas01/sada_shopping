require 'spec_helper'

describe 'Posting a product review' do 

  it "redirects the user to the review form page" do

  	product = Product.create!(product_details)
    user = User.create!(user_details)
    visit product_url(product)
    click_link 'Write review'
    sign_in_user(user)

    expect(current_path).to eq(new_product_review_path(product))
  end	

  it "saves the review if the fields are valid" do

    product = Product.create!(product_details)
    user = User.create!(user_details)
    visit product_url(product)
    click_link 'Write review'
    sign_in_user(user)

    select 4, :from => "review_stars"
    fill_in "Comment", with: "This is a great product!"

    click_button 'Post Review'

    expect(page).to have_text("Thanks for your review!")
  end	

  it "does not save the review if any field is invalid" do

    product = Product.create!(product_details)
    user = User.create!(user_details)
    visit product_url(product)
    click_link 'Write review'
    sign_in_user(user)

    expect {
      click_button 'Post Review'
    }.not_to change(Review, :count)

    expect(page).to have_text('error')
  end	
end
