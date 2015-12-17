require 'spec_helper'

describe "Deleting an user" do
  it "deletes the user and rediract to the users listing page" do
    user = User.create!(user_details)
    
    sign_in_user(user)

    visit user_path(user)

    click_link 'Delete account'

    expect(current_path).to eq(products_path)
    expect(page).to have_text("Your account has been deleted!")
    expect(page).not_to have_text(user.name)
  end	

  it "automalically signs out the user if they are signed in" do
    user = User.create!(user_details)
    
    
    visit products_url

   sign_in_user(user)

    visit user_path(user)

    click_link 'Delete account'

    expect(page).to have_link('Sign In')
    expect(page).to have_link('Sign Up')
    expect(page).not_to have_link('Sign Out')
  end	
end