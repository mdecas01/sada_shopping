require 'spec_helper'

describe "Viewing a list of users"  do
  it "shows a list of users" do
    user1 = User.create!(name: "user1",
    	                email: "user1@example.com",
    	                password: "bigsecret",
    	                password_confirmation: "bigsecret")

    user2 = User.create!(name: "user2",
    	                email: "user2@example.com",
    	                password: "hugesecret",
    	                password_confirmation: "hugesecret")

  visit users_url

  expect(page).to have_text(user1.name)
  expect(page).to have_text(user2.name)
  end	
end