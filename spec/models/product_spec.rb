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

  it "is saved only if the name, description and price fields are not blank" do
    product = Product.new

    product.valid?

    expect(product.errors[:name].any?).to eq(true)
    expect(product.errors[:description].any?).to eq(true)
    expect(product.errors[:price].any?).to eq(true)
  end

  it "is saved only if the description is longer than 10 characters" do
    product = Product.new(name: "Folding chair",
                          description: "Res",
                          price: 20.99,
                          quantity: 0 
                          )

    product.valid?

    expect(product.errors[:description].any?).to eq(true)
  end

  it "is saved if the price is a positive number" do
     product = Product.new(name: "Folding chair",
                          description: "Resistent and confortable",
                          price: -20.99,
                          quantity: 0 
                          )

     product.valid?

     expect(product.errors[:price].any?).to eq(true)
  end  

  it "is saved if the quantity is a number bigger or equal to 0" do
     product = Product.new(name: "Folding chair",
                          description: "Resistent and confortable",
                          price: 20.99,
                          quantity: " " 
                          )

     product.valid?

     expect(product.errors[:quantity].any?).to eq(true)
  end 

  it "is saved if the image_url field is blank or have a GIF, JPG, or PNG extensions" do
     product = Product.new(name: "Folding chair",
                          description: "Resistent and confortable",
                          price: 20.99,
                          quantity: 0
                          )

     product2 = Product.new(name: "Folding chair 2",
                          description: "Resistent and confortable",
                          price: 20.99,
                          quantity: 0,
                          image_url: 'no-image.pdf'
                          )

     product.valid?
     product2.valid?

     expect(product.errors[:image_url].any?).to eq(false)
     expect(product2.errors[:image_url].any?).to eq(true)
  end 

  it "has many reviews" do
    product = Product.new(product_details)

    review1 = product.reviews.new(review_details)
    review2 = product.reviews.new(review_details)

    expect(product.reviews).to include(review1)
    expect(product.reviews).to include(review2)
  end

it "deletes associated reviews" do
  product = Product.create(product_attributes)

  product.reviews.create(review_details)

  expect {
    product.destroy
  }.to change(Review, :count).by(-1)
end
end
