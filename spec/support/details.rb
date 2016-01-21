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

def category1_details(overrides = {})
  {
    name: "Home",
    level: 1,
    parent: nil
  }.merge(overrides)
end

def category2_details(overrides = {})
  {
    name: "Forniture",
    level: 2,
    parent: 1
  }.merge(overrides)
end

def category3_details(overrides = {})
  {
    name: "Tables and chairs",
    level: 3,
    parent: 2
  }.merge(overrides)
end
