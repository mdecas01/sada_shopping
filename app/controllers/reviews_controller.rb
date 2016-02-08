class ReviewsController < ApplicationController

  #requests the user to sign in if he/she has not already done so
  before_action :request_signin_first, except: [:index, :show]

  before_action :allow_admin_user, only: [:destroy]

  before_action :find_product

  def index
    @reviews = @product.reviews
  end	

  def new
    @review = @product.reviews.new
  end	

  def create
    @review = @product.reviews.new(review_params)

    #assings the logged user to the review
    @review.user = logged_user

    if @review.save
      redirect_to product_reviews_path(@product), notice: "Thanks for your review!"
    else
      render :new
    end    
  end	

  private

  def review_params
      params.require(:review).permit(:stars, :comment)
  end
end
