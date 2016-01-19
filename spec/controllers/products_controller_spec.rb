require 'spec_helper'

describe ProductsController do

  context "if a user is not an admin" do

    before do
      @product = Product.create!(product_details)
      user = User.create!(user_details(admin: false))
      session[:user_id] = user
    end

    it "he/she cannot access the edit action" do
      get :edit, id: @product

      expect(response).to redirect_to(products_url)
    end

    it "he/she cannot access the update action" do
      patch :update, id: @product

      expect(response).to redirect_to(products_url)
    end

    it "he/she cannot access the destroy action" do
      delete :destroy, id: @product

      expect(response).to redirect_to(products_url)
    end

  end
end
