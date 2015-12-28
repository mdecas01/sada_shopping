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

def order_details(overrides = {})
  {
    address: "Bermondsey, London",
    payment_type: "Check"
  }.merge(overrides)
end

def review_details(overrides = {})
  {
    stars: 3,
    comment: "Excelent product!"
  }.merge(overrides)
end


