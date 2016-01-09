FactoryGirl.define do
  factory :user do
    name: "User1",
    email: "user1@example.com",
    password: "password",
    password_confirmation: "password"
  end	
end