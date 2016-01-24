require 'spec_helper'

describe "The user" do

  it "must have a name" do
    user = User.new(name: "")

    user.valid? 

    expect(user.errors[:name].any?).to eq(true)
  end

  it "must have an email" do
    user = User.new(email: "")

    user.valid?

    expect(user.errors[:email].any?).to eq(true)
  end
  
  it "must have a properly formatted email addresse" do
    emails = %w[user1@example.com some.email@example.com]
    emails.each do |email|
      user = User.new(email: email)
      user.valid?
      expect(user.errors[:email].any?).to eq(false)
    end
  end
  
  it "does not accept a badly formatted email" do
    emails = %w[@ user1@   @example.com]
    emails.each do |email|
      user = User.new(email: email)
      user.valid?
      expect(user.errors[:email].any?).to eq(true)
    end
  end

  it "must have a unique, case insensitive email address" do
    user1 = User.create!(user_details)

    user2 = User.new(email: user1.email.upcase)
    user2.valid?
    expect(user2.errors[:email].first).to eq("has already been taken")
  end

  it "must have a password" do
    user = User.new(password: "")

    user.valid?

    expect(user.errors[:password].any?).to eq(true)
  end

  it "must have a password confirmation" do
    user = User.new(password: "password", password_confirmation: "")

    user.valid?

    expect(user.errors[:password_confirmation].any?).to eq(true)
  end

  it "must have a password that matches the password confirmation" do
    user = User.new(password: "passwrd", password_confirmation: "anotherpassword")

    user.valid?

    expect(user.errors[:password_confirmation].first).to eq("doesn't match Password")
  end

  it "must have both password and password confirmation when created" do
    user = User.create!(user_details(password: "password", password_confirmation: "password"))

    expect(user.valid?).to eq(true)
  end

  it "does not need a password when updated" do
    user = User.create!(user_details)

    user.password = ""

    expect(user.valid?).to eq(true)
  end

  it "automatically encrypts the password into the password_digest attribute" do
    user = User.new(password: "password")

    expect(user.password_digest.present?).to eq(true)
  end

  it "is valid if the combination email/password matches" do
    user = User.create!(user_details)

    returned_user = User.authenticate(user.email, user.password)

    expect(returned_user).to eq(user)
  end  

  it "is not valid if the email does not matches" do
    user = User.create!(user_details)

    returned_user = User.authenticate("something", user.password)

    expect(returned_user).not_to eq(user)
  end 

  it "is not valid if the password does not matches" do
    user = User.create!(user_details)

    returned_user = User.authenticate(user.email, "something")

    expect(returned_user).not_to eq(user)
  end

  it "has wished products" do
  user = User.new(user_attributes)
  product1 = Product.new(product_attributes(title: "Folding Chair 4"))
  product2 = Product.new(product_attributes(title: "Folding Chair 5"))

  user.whishlists.new(product: product1)
  user.whishlists.new(product: product2)

  expect(user.whishlists).to include(product1)
  expect(user.whishlists).to include(product2)
end
end