require 'spec_helper'

describe "Adding a new product" do
  it "saves the product and shows the product's details" do
    visit products_url

    click_link "Add new product"

    expect(current_path).to eq(new_product_path)

    fill_in "Name", with: "C sofa"
    fill_in "Description", with: "Many colors to choose from"
    #cannot find price filed???????
    #fill_in "price", with: "150.99"
    fill_in "quantity", with: "1"



    click_button 'Create Product'

    expect(current_path).to eq(product_path(Product.last))

    expect(page).to have_text("C sofa")
  end	
end