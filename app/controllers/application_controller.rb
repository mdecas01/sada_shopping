class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
  
  #creates a cart if no one  exists yet
  def create_cart
    @cart = Cart.find(session[:id])
  rescue ActiveRecord::RecordNotFound
    @cart = Cart.create
    session[:id] = @cart.id
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

  def find_category_name(category_id)
    if category_id.nil?
      "None"
    else  
      Category.find(category_id) 
    end  
  end 

  helper_method :find_category_name 

end
