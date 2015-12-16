def product_details(overrides = {})
  {
   name: "Folding chair",
   description: "Resistent and confortable",
   price: 20.99,
   quantity: 1
  }.merge(overrides)
end



def user_details(overrides = {})
  {
    name: "User1",
    email: "user1@example.com",
    password: "password",
    password_confirmation: "password"
  }.merge(overrides)
end


