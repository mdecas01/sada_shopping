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
    if @product.update(product_attributes)
      flash.notice = "Product seccessfully updated!"
      redirect_to @product
    else
      render :edit
    end  
  end	

  def new
    @product = Product.new
  end	

  def create
    @product = Product.new(product_attributes)
    if @product.save
      flash[:notice] = "Product successfully created!"
      redirect_to @product
    else
      render :new  
    end	
  end

    def destroy
      @product = Product.find(params[:id])
      @product.delete
      flash[:alert] = "Product successfully deleted!"
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
