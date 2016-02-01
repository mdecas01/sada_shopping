class WishlistsController < ApplicationController

  before_action :request_signin_first, only:[:create]

	def index
	  if params[:search]
      	@users = User.search(params[:search])
      else
        @wishlists = Wishlist.all
      end 
	end	

	def show
      @wishlist = Wishlist.where(user: params[:user_id])
	end	

	def create
      @product = Product.find(params[:product_id])
      @product.wishlists.create!(user: logged_user)
      redirect_to @product, notice: "Product was added to your wishlist!"
	end	

	def destroy
      @product = Product.find(params[:product_id])
      wishlist = logged_user.wishlists.find(params[:id])
      wishlist.destroy
      redirect_to @product, notice: "The product was removed from wishlist!"
    end		
end
