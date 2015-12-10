require 'spec_helper'

describe "Adding a product to a cart" do

  it "saves the product in the product line table" do
    product = Product.create(product_details)
    
    visit product_url(product)

    click_button 'Add to cart'

    expect(ProductItem.count).to eq(1)
  end 

end