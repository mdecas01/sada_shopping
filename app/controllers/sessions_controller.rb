class SessionsController < ApplicationController

  def new
  end

  def create
    if user = User.authenticate(params[:email], params[:password]) 
      session[:user_id] = user.id
      flash[:notice] = "Hello, #{user.name}!"
      if session[:url]
        #redirects to the desired URL
        redirect_to session[:url]
        session[:url] = nil
      else  
        redirect_to user_path(user)
      end  
    else
      flash.now[:alert] = "Invalid email/password combination!"
      render :new
    end	
  end

  def destroy
    @cart = Cart.find(session[:id])
    @cart.destroy
      
    session[:user_id] = nil
    redirect_to products_path, notice: "You are signed out!"
  end	
end

