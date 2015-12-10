require 'spec_helper'

describe "Viewing the product's page" do

  it "shows the product details" do

    product = Product.create(product_details)

   visit product_url(product)

    expect(page).to have_text(product.name)
    expect(page).to have_text(product.description)
    expect(page).to have_text("£20.99")
    expect(page).to have_selector("img[src$='#{product.image_url}']")
  end	

end