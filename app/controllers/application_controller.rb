class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
  
  #creates a cart if no one  exists yet
  def create_cart
    @cart = Cart.find(session[:id])
    @cart.total_price(@cart.coupon)
  rescue ActiveRecord::RecordNotFound
    @cart = Cart.create
    session[:id] = @cart.id
    @cart.total_price(@cart.coupon)
  end
  
  #checks if the user is logged and is an admin
  def admin_user?
    logged_user && logged_user.admin?
  end  

  helper_method :admin_user?
  
  #restricts access to not signed in users
  def request_signin_first
    unless logged_user
      #assigns the url the the user intends to go to
      session[:url] = request.url
      redirect_to signin_url, alert: "You must sign in first!"
    end
  end	
  
  #returns the user according to the user_id hash
  def logged_user
       @logged_user ||= User.find(session[:user_id]) if session[:user_id]   
  end
  
  #makes the method also accessible by the view templates
  helper_method :logged_user

  #checks if the profile page is the same as the user currently logged in
  def logged_user?(user)
    user == logged_user
  end  

  helper_method :logged_user?
	
  #if the user is not an admin redirects to the main page
  def allow_admin_user
    unless admin_user?
      redirect_to products_url, alert: "You are not authorized to perform this action!"
    end  
  end 

      #checks if the relation of the child and parent categories is correct
    def check_categories_relation(category_ids) 
      #all the three category levels must be present
      if category_ids.values[0].to_i == 0 || category_ids.values[1].to_i == 0 || category_ids.values[2].to_i == 0
        false
      else
        cat = Category.find(category_ids.values[1].to_i)
        cat2 = Category.find(category_ids.values[2].to_i)
        
        cat.parent == category_ids.values[0].to_i && cat2.parent == category_ids.values[1].to_i
      end    
    end  

    #sets the products attributes according to the passed parameters
    def set_product
      @product = Product.find(params[:id])
    end 

    def find_product
      @product = Product.find(params[:product_id])
    end 

end

