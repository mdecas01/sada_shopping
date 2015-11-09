require 'spec_helper'

describe "Adding a new product"  do
	it "add a 'new' keyword" do
      product = Product.create(product_details)

      visit products_url

      expect(page).to have_text("new")
	end	
end