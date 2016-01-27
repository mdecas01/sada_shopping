class WishlistsController < ApplicationController
    before_action :request_signin_first

	def index
	  if params[:user_id]
	    @user = User.find(logged_user)
        @wishlists = Wishlist.where(user: @user)
      else
        @wishlists = Wishlist.all
      end 
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
