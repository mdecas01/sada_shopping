require 'spec_helper'

describe "Adding a product to a cart" do
  it "shows a message acknowledging the action" do
    product = Product.create(product_details)
    
    visit product_url(product)

    click_button 'Add to cart'

    expect(page).to have_text("Product successfully added!")
  end	

  it "saves the product in the product line table" do
    product = Product.create(product_details)
    
    visit product_url(product)

    click_button 'Add to cart'
    click_button 'Add to cart'

    expect(ProductItem.count).to eq(2)
  end 

end