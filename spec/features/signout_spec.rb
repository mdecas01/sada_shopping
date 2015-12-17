require 'spec_helper'

describe "Signing out" do
  it "removes the user id from the session" do
  	user = User.create!(user_details)

    visit products_url

    sign_in_user(user)

    click_link 'Sign Out'

    expect(page).to have_text("You are signed out!")
    expect(page).to have_link('Sign Up')
    expect(page).to have_link('Sign In')
    expect(page).not_to have_link('Sign Out')
  end	

    it "redirects the user to the users main page" do
    user = User.create!(user_details)	

    visit products_url

    sign_in_user(user)

    click_link 'Sign Out'

    expect(current_path).to eq(products_path)
  end
end