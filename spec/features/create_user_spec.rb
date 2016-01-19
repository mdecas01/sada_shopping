require 'spec_helper'

describe "Creating a user" do
  it "saves the user and redirects to the user's profile page" do
    visit products_url

    click_link 'Sign Up'

    fill_in "Name",  with: "User number 1"
    fill_in "Email", with: "user1@example.com"
    fill_in "Password", with: "password"
    fill_in "Confirm Password", with: "password"

    click_button 'Create account'
    user = User.find_by(name: "User number 1")

    expect(current_path).to eq(user_path(user))

    expect(page).to have_text('User number 1')
    expect(page).to have_text('Thanks for signing up!')
  end	

   it "automatically signs the user in" do
    visit products_url

    click_link 'Sign Up'

    fill_in "Name",  with: "User number 1"
    fill_in "Email", with: "user1@example.com"
    fill_in "Password", with: "password"
    fill_in "Confirm Password", with: "password"

    click_button 'Create account'

    expect(page).to have_text("Hello, User number 1")
  end 

  it "does not save a user with empty details" do
    visit signup_url

    click_button 'Create account'

    expect(User.count).to eq(0)
    expect(page).to have_text('error')
  end
end