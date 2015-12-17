require 'spec_helper'

describe "editing a user" do 

  it "redirects to the edit url when edit account link is clicked" do
    user = User.create!(user_details)
    
    sign_in_user(user)
    
    visit user_url(user)

    click_link 'Edit account'

    expect(current_path).to eq(edit_user_path(user))
  end

    it "populates the edit form with the details of the current user" do
    user = User.create!(user_details)

    sign_in_user(user)

    visit user_url(user)

    click_link 'Edit account'

    expect(find_field('Name').value).to eq(user.name)
  end

  it "updates the user details and redirects to the user's profile" do
    user = User.create!(user_details)
    
    sign_in_user(user)

    visit user_url(user)

    click_link 'Edit account'

    fill_in "Name", with: "New username"

    click_button 'Update account'
    
    expect(current_url).to eq(user_url(user))
    expect(page).to have_text("New username")
    expect(page).to have_text("Your account was successfully updated!")
  end	

  it "does not update the user if any detail is invalid" do
    user = User.create!(user_details)
    
    sign_in_user(user)

    visit edit_user_url(user)

    fill_in "Name", with: " "

    click_button "Update account"

    expect(page).to have_text("Sorry, the user could not be saved")
  end	
end