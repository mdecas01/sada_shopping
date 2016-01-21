require 'spec_helper'

describe "Viewing the list of products" do
  
  it "shows the products" do

  product1 = Product.create!(name: "Folding chair",
                            description: "Easy to store, folding chair",
                            price: 10.99,
                            quantity: 1)	

  product2 = Product.create!(name: "Coffe table",
                            description: "Strong and easy to assemble ",
                            price: 20.99,
                            quantity: 1)

  product3 = Product.create!(name: "Lenew laptop",
                            description: "Perfect for work and gaming",
                            price: 499.99,
                            quantity: 0)
  visit products_url

  expect(page).to have_text(product1.name)
  expect(page).to have_text(product1.description[0..6])
  expect(page).to have_text("£10.99")
  expect(page).to have_text(product2.name)
  expect(page).to have_text(product2.description[0..6])
  expect(page).to have_text("£20.99")

  expect(page).to have_text("Not currently available")
  end
  
  it "shows the Add New Product, Add New Category and Manage Categories only if user is admin" do
    user = User.create!(user_details(admin: true))
    sign_in_user(user)

    visit products_url
    
    page.should have_link("Add new product")
    page.should have_link("Add new category")
    page.should have_link("Manage categories")
  end
  
end
