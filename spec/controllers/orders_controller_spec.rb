require 'spec_helper'

describe OrdersController do

  before do
      @user = User.create!(user_details)
      @order = Order.create!(order_details)
    end 

  context "if a user is not an admin" do
    
    before do
      session[:user_id] = @user
    end
      
    it "he/she cannot access the edit action" do
      get :edit, id: @order

      expect(response).to redirect_to(products_url)
    end

    it "he/she cannot access the update action" do
      patch :update, id: @order

      expect(response).to redirect_to(products_url)
    end

    it "he/she cannot access the destroy action" do
      delete :destroy, id: @order

      expect(response).to redirect_to(products_url)
    end

  end
end