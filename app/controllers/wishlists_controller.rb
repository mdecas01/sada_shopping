class WishlistsController < ApplicationController

	def index
	  if params[:user_id]
	    @user = User.find(logged_user)
        @wishlists = Wishlist.where(user: @user)
      elsif params[:search]
      	@user = User.search(params[:search]).first
      	@wishlists = Wishlist.where(user_id: @user.id)
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
