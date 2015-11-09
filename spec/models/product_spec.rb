require 'spec_helper'

describe "A product" do
  it "is new if the created_at is less the the current time" do
    product = Product.create(product_details)

    expect(product.new?).to eq(true)
  end

  it "is not available if its quantity is equals to 0" do 
    product = Product.create(name: "Folding chair",
                             description: "Resistent and confortable",
                             price: 20.99,
                             quantity: 0 )

    expect(product.available?).to eq(false)
  end	

  it "is not available if its quantity is nil" do 
    product = Product.create(name: "Folding chair",
                             description: "Resistent and confortable",
                             price: 20.99,
                             quantity: nil )

    expect(product.available?).to eq(false)
  end
end
