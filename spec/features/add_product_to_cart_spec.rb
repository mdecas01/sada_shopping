require 'spec_helper'

describe "Adding a product to a cart" do

  it "saves the product in the product line table" do
    product = Product.create(product_details)
    
    visit product_url(product)

    click_button 'Add to cart'

    expect(ProductItem.count).to eq(1)
  end 

  it "ahows the quantity according to how many times the product was added" do
    product = Product.create(name: "Folding chair",
                             description: "Easy to store, folding chair",
                             price: 10.99,
                             quantity: 1,
                             image_url: "folding-chair.jpg")
    
    visit product_url(product)

    click_button 'Add to cart'
    click_button 'Add to cart'

    expect(page).to have_text("2x Folding chair")
  end 

end