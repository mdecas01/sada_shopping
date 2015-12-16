require 'spec_helper'

describe "Deleting an user" do
  it "deletes the user and rediract to the users listing page" do
    user = User.create!(user_details)

    visit user_path(user)

    click_link 'Delete account'

    expect(current_path).to eq(users_path)
    expect(page).to have_text("Your account has been deleted!")
    expect(page).not_to have_text(user.name)
  end	
end