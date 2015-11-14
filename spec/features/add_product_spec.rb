require 'spec_helper'

describe "Adding a new product" do
  it "saves the product and shows the product's details" do
    visit products_url

    click_link "Add new product"

    expect(current_path).to eq(new_product_path)

    fill_in "Name", with: "C sofa"
    fill_in "Description", with: "Many colors to choose from"
    fill_in "Price", with: 150.99
    fill_in "Quantity", with: 1



    click_button 'Create Product'

    expect(current_path).to eq(product_path(Product.last))

    expect(page).to have_text("C sofa")
    expect(page).to have_text("Product successfully created!")
  end	

  it "does not save the product if it field are invalid" do
    visit new_product_url

    click_button 'Create Product'

    expect(Product.count).to eq(0)
    expect(current_path).to eq(products_path)   
  end  
end