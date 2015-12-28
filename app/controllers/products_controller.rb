class ProductsController < ApplicationController

	before_action :set_products, except: [:index, :new, :create]
  #creates a cart if one not exists yet
  before_action :create_cart

  #requests the user to sign in if he/she has not already done so
  before_action :request_signin_first, except: [:index, :show]
  
  #checks if the logged user is an admin
  before_action :allow_admin_user, except: [:index, :show]

	def index
      @products = Product.all.page(params[:page]).per_page(10)
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
    params[:category].each do |cat| 
      @product.categories << Category.find(cat[1])  
    end
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
      params.require(:product).permit(:id, :name, :description, :price, :quantity, :image_url, :category)
    end

end
