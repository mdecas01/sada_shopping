require 'spec_helper'

describe 'Clicking empty cart button' do
	it 'deletes the current cart' do
      product = Product.create(product_details)

      visit product_path(product)
      
      click_button 'Add to cart'

      click_link 'Empty cart'

      expect(page).not_to have_text("product in your shopping cart")
	end	

	it 'displays a message' do
      product = Product.create(product_details)

      visit product_path(product)
      
      click_button 'Add to cart'

      click_link 'Empty cart'

      expect(page).to have_text('Shopping cart is empty!')
	end

      it "redirects to the products catalogue page" do
        product = Product.create(product_details)

        visit product_path(product)
      
        click_button 'Add to cart'

        click_link 'Empty cart'  

        expect(current_path).to eq(products_path) 
      end      
end