class UsersController < ApplicationController
  
  #requests the user to sign in if he/she has not already done so
  before_action :request_signin_first, except: [:new, :create]
  
  #checks if the user logged in is the same as the profile being changed
  before_action :check_correct_user, only: [:edit, :update, :destroy]

  def index
    @users = User.all
  end	

  def show
    @user = User.find(params[:id])
  end	

  def new
    @user = User.new
  end	

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user), notice: 'Thanks for signing up!'
    else
      render :new
    end    
  end

  def edit
    @user = User.find(params[:id])
  end	

  def update
  	@user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "Your account was successfully updated!"
    else
      render :edit
    end    
  end	

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    session[:user_id] = nil
    redirect_to products_url, notice: "Your account has been deleted!"
  end	

  private

  def user_params
    #does not permit
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end	
  
  #checks if the user is the owner of the profile
  def check_correct_user
    @user = User.find(params[:id])
    unless logged_user?(@user) 
      redirect_to users_url, alert: "You are not authorized to change this account!"
    end  
  end
end
