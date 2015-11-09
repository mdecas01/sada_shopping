class ProductsController < ApplicationController

	before_action :set_products, except: [:index, :new, :create]

	def index
      @products = Product.all
	end	

	def show
    end	

    def edit  
    end	

    def update
      product = Product.find(params[:id])
      product.update(product_attributes)
      redirect_to product
    end	

    def new
      @product = Product.new
    end	

    def create
      @product = Product.new(product_attributes)
      @product.save
      redirect_to @product
    end	

    def destroy
      @product = Product.find(params[:id])
      @product.delete
      redirect_to products_url
    end  

    private
    
    #sets the products attributes according to the passed parameters
    def set_products
      @product = Product.find(params[:id])
    end	
    
    #set attributes that can be assigned
    def product_attributes
      params.require(:product).permit(:name, :description, :price, :quantity, :image_url)
    end

end
