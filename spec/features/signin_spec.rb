require 'spec_helper'

describe "Signing in" do 
  it "displays the sign in form" do
    visit products_url

    click_link 'Sign In'

    expect(current_url).to eq(signin_url)

    expect(page).to have_field("Email")
    expect(page).to have_field("Password")
  end	

  it "signs the user in if the email and password are correct" do
    user = User.create!(user_details)

    visit products_url

    click_link 'Sign In'

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password

    click_button 'Sign In'

    expect(current_url).to eq(user_url(user))
    expect(page).to have_text("Hello, #{user.name}!")
  end

  it "does not sign the user in, and displays the error if the email and/or password are incorrect" do
    user = User.create!(user_details)

    visit products_url

    click_link 'Sign In'

    fill_in "Email", with: " "
    fill_in "Password", with: " "

    click_button 'Sign In'

    expect(page).to have_text("Invalid email/password combination!")
  end	

  it "redirects the user to the desired URL" do
    user = User.create!(user_details)

    visit users_url

    sign_in_user(user)

    expect(current_path).to eq(users_path)
  end  
end