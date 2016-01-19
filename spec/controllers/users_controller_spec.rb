require 'spec_helper'

describe UsersController do

  before do
    @user = User.create!(user_details)
  end

  context "if a user is not signed in" do

    before do
      session[:user_id] = nil
    end

    it "he/she cannot access the index action" do
      get :index

      expect(response).to redirect_to(signin_url)
    end

    it "he/she cannot access the show action" do
      get :show, id: @user.id

      expect(response).to redirect_to(signin_url)
    end

    it "he/she cannot access the edit action" do
      get :edit, id: @user.id

      expect(response).to redirect_to(signin_url)
    end

    it "he/she cannot access the update action" do
      patch :update, id: @user.id

      expect(response).to redirect_to(signin_url)
    end

    it "he/she cannot access the destroy action" do
      delete :destroy, id: @user.id

      expect(response).to redirect_to(signin_url)
    end

  end

  context "if a user is logged in but tries to change another user account details" do
    
    before do
      #creates a user with a different email of the defalult one
      @another_user = User.create!(user_details(email: "another@sadashopping.com"))
      session[:user_id] = @another_user.id
    end 

    it "the access to edit action is denied" do
      get :edit, id: @user.id

      expect(response).to redirect_to(users_url)
    end 

    it "the access to update action is denied" do
      patch :update, id: @user.id

      expect(response).to redirect_to(users_url)
    end 

    it "the access to destroy action is denied" do
      delete :destroy, id: @user.id

      expect(response).to redirect_to(users_url)
    end 
  end 
end