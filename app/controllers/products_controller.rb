class ProductsController < ApplicationController

	before_action :set_product, except: [:index, :new, :create]
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
    if @product.update(product_attributes)  ############
      if check_categories_relation(params[:category])
          @product.categories.delete_all
            params[:category].each do |cat| 
              @product.categories << Category.find(cat[1]) 
            end 
          flash[:notice] = "Product seccessfully updated!"
          redirect_to @product
      else
        flash.now[:alert] = "Ther was a problem with one or more categories. Please check...for more"  
        render :edit
      end   
    else
      render :edit
    end  
  end	

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_attributes)

      if check_categories_relation(params[:category]) #############
        params[:category].each do |cat| 
          @product.categories << Category.find(cat[1]) 
        end                         
        
        if @product.save
          flash[:notice] = "Product successfully created!"
          redirect_to @product
        else
          render :new  
        end	
      else
        flash.now[:alert] = "The was a problem in one or more chosen categories! Visit manage categories for more information."
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
    def set_product
      @product = Product.find(params[:id])
    end	
    
    #set attributes that can be assigned
    def product_attributes
      params.require(:product).permit(:id, :name, :description, :price, :quantity, :image_url, :category )
    end
    
    #checks if the relation of the child and parent categories is correct
    def check_categories_relation(category_ids) ##################HERE##############
      if category_ids.values[0].to_i == 0 || category_ids.values[1].to_i == 0 || category_ids.values[2].to_i == 0
        false
      else
        cat = Category.find(category_ids.values[1].to_i)
        cat2 = Category.find(category_ids.values[2].to_i)
        cat.parent == category_ids.values[0].to_i && cat2.parent == category_ids.values[1].to_i
      end    
    end  
    
  def find_category_name(category_id)
    if category_id == 0
      "None"
    else  
      Category.find(category_id) 
    end  
  end 

  helper_method :find_category_name 
end
