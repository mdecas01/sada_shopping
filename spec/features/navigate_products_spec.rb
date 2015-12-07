require 'spec_helper'

describe "Viewing a product page"  do
  it "allows navigating to the products catalogue page" do
    product = Product.create(product_details)

    visit product_url(product)

    click_link "Return"

    expect(current_path).to eq(products_path)
  end

    it "allows navigating to the product's details page" do
    product = Product.create(product_details)

    visit products_url

    click_link product.name

    expect(current_path).to eq(product_path(product))
  end
end