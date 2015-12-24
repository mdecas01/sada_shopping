require 'spec_helper'

require 'spec_helper'

describe "A review" do

  it "must be associated to a product" do
    product = Product.create(product_details)
    
    #initializes the review as a child from the parent 'Product'
    review = product.reviews.new(review_details)

    expect(review.product).to eq(product)
  end

  it "must be associated to a user" do
    user = User.create(user_details)
    product = Product.create(product_details)
    review = Review.new(review_details)

    review.user = user
    review.product = product

    expect(review.valid?).to eq(true)
  end

  it "must have a comment" do
    review = Review.new(comment: "")

    review.valid?

    expect(review.errors[:comment].any?).to eq(true)
  end

  it "comment must be more than 5 characteres long" do
    review = Review.new(comment: "it i")

    review.valid?

    expect(review.errors[:comment].any?).to eq(true)
  end

  it "accepts star values of 1 through 5" do
    stars = [1, 2, 3, 4, 5]
    stars.each do |star|
      review = Review.new(stars: star)

      review.valid?

      expect(review.errors[:stars].any?).to eq(false)
    end
  end

  it "rejects invalid star values" do
    stars = [-1, 0, 6]
    stars.each do |star|
      review = Review.new(stars: star)

      review.valid?

      expect(review.errors[:stars].any?).to eq(true)
      expect(review.errors[:stars].first).to eq("must be between 1 and 5")
    end
  end
end
