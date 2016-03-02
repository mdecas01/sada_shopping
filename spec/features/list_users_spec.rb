require 'spec_helper'

describe "Viewing a list of users"  do

  it "shows the link to the users only if the user is an admin" do
    user1 = User.create!(name: "user1",
                      email: "user1@example.com",
                      password: "bigsecret",
                      password_confirmation: "bigsecret")

    sign_in_user(user1)

    expect(page).not_to have_link("Users")
  end 

  it "shows the list of users" do
    user1 = User.create!(name: "user1",
                      email: "user1@example.com",
                      password: "bigsecret",
                      password_confirmation: "bigsecret")

    user2 = User.create!(name: "user2",
                      email: "user2@example.com",
                      password: "bigsecret2",
                      password_confirmation: "bigsecret2",
                      admin: true)

    sign_in_user(user2)

    click_link "Users"

    expect(page).to have_link("user1")
    expect(page).to have_link("user2")
  end 
end