require 'spec_helper'

describe "Viewing a user profile page" do
  it "shows the user name" do
    user = User.create!(user_details)

    visit products_url
    
    #user must sign in to see his/her profile
    sign_in_user(user)

    expect(page).to have_text(user.name)
    expect(page).to have_link(user.email)
  end	
end