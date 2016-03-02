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

  visit products_url

  expect(page).to have_text(product1.name)
  expect(page).to have_text(product1.description[0..6])
  expect(page).to have_text("£10.99")
  expect(page).to have_text(product2.name)
  expect(page).to have_text(product2.description[0..6])
  expect(page).to have_text("£20.99")

  end

  it "shows whether the product is available or not" do
    product1 = Product.create!(name: "Coffe table",
                            description: "Strong and easy to assemble ",
                            price: 20.99,
                            quantity: 1)

    product2 = Product.create!(name: "Lenew laptop",
                            description: "Perfect for work and gaming",
                            price: 499.99,
                            quantity: 0)

    visit products_url

    expect(page).to have_text("OUT OF STOCK")
    expect(page).to have_text("IN STOCK")

  end

  it "display a search box" do

    visit products_url

    page.should have_button("Search")

  end

   it "displays only the products entered in the search box" do
    product1 = Product.create!(name: "Coffe table",
                            description: "Strong and easy to assemble ",
                            price: 20.99,
                            quantity: 1)

    product2 = Product.create!(name: "Lenew laptop",
                            description: "Perfect for work and gaming",
                            price: 499.99,
                            quantity: 0)

    visit products_url
    
    fill_in "search", with: "Coffe table"
    click_button "Search"

    expect(page).to have_text("Coffe table")
    expect(page).not_to have_text("Lenew laptop")

  end 
  
  it "has a link to the product page" do
    product1 = Product.create!(name: "Folding chair",
                               description: "Easy to store, folding chair",
                               price: 10.99,
                               quantity: 1)

    visit products_url

    page.should have_link("Folding chair")
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
