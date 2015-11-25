require 'spec_helper'

describe 'Clicking empty cart button' do
	it 'deletes the current cart' do
      product = Product.create(product_details)

      visit product_path(product)
      
      click_button 'Add to cart'

      click_link 'View cart'

      click_button 'Empty cart'

      expect(@cart).to eq(nil)
	end	

	it 'displays a message' do
      product = Product.create(product_details)

      visit product_path(product)
      
      click_button 'Add to cart'

      click_link 'View cart'

      click_button 'Empty cart'

      expect(page).to have_text('Shopping cart is empty!')
	end
end