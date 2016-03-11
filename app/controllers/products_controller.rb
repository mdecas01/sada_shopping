class ProductsController < ApplicationController

	before_action :set_product, except: [:index, :new, :create]
  #creates a cart if one not exists yet
  before_action :create_cart

  #requests the user to sign in if he/she has not already done so
  before_action :request_signin_first, except: [:index, :show]
  
  #checks if the logged user is an admin
  before_action :allow_admin_user, except: [:index, :show]

	def index
    if params[:category]
     #selects a category
     @category = Category.find_by(name: params[:category].values[0])
      #gets the categorizations that have the category above
      cat = Categorization.where(category_id: @category.id)
      @products = Array.new
      cat.each do |c|
        @products << Product.find(c.product_id)
      end
    elsif params[:chosen_category]
      @category = Category.find(params[:chosen_category])
      cat = Categorization.where(category_id: @category.id)
      @products = Array.new
      cat.each do |c|
        @products << Product.find(c.product_id)
      end
    else  
      @products = Product.search(params[:search]) 
    end    
	end	

	def show
    @customers = @product.customers
    if logged_user
      @user_wishlist = logged_user.wishlists.find_by(product_id: @product.id)
    end  
  end	

  def edit  
  
  end	

  def update
    
    category_ids = Hash.new
    category_ids["category1_id"] = Category.find_by(name: params[:category1_id]).id
    category_ids["category2_id"] = Category.find_by(name: params[:category2_id]).id
    category_ids["category3_id"] = Category.find_by(name: params[:category3_id]).id

    if @product.update(product_attributes)  ############
      if check_categories_relation(category_ids)
          @product.categories.delete_all
            category_ids.each do |cat| 
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

      if check_categories_relation(params[:category]) 
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
      @product.destroy
      flash[:alert] = "Product successfully deleted!"
      redirect_to products_url
    end  

    private
    
    #set attributes that can be assigned
    def product_attributes
      params.require(:product).permit(:id, :name, :description, :price, :quantity, :image_url, :category )
    end 
    
  def find_category_name(category_id)
    if category_id == 0
      "None"
    else  
      Category.find(category_id) 
    end  
  end 

  helper_method :find_category_name 
   

  #def find_product_by_category(params)
#      @category = Category.find_by(name: params.values[0])
#      cat = Categorization.where(category_id: @category.id)
#      @products = Array.new
#      cat.each do |c|
#        @products << Product.find(c.product_id)
#     end  
#  end  

end
