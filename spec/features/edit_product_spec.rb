require 'spec_helper'

describe "Editing a product details" do 

  before do
    user_admin = User.create!(user_details(admin: true))
    sign_in_user(user_admin)
  end

  it "fills the forms with the products details" do
    product = Product.create!(product_details)
    category_level_1 = Category.create!(category1_details)
    category_level_2 = Category.create!(category2_details)
    category_level_3 = Category.create!(category3_details)
    product.categories << category_level_1 
    product.categories << category_level_2
    product.categories << category_level_3

    visit product_url(product)

    click_link "Edit product"

      expect(current_path).to eq(edit_product_path(product))
      expect(find_field('Name').value).to eq(product.name)
      expect(find_field('Description').value).to eq(product.description)

      fill_in 'Name', with: "New folding chair"

      click_button 'Update Product'

      expect(current_path).to eq(product_path(product))

      expect(page).to have_text("New folding chair")
      expect(page).to have_text("Product seccessfully updated!")
   end	

   it "does not update the product if any of its fields is invalid" do
    product = Product.create!(product_details)
    category_level_1 = Category.create!(category1_details)
    category_level_2 = Category.create!(category2_details)
    category_level_3 = Category.create!(category3_details)
    product.categories << category_level_1 
    product.categories << category_level_2
    product.categories << category_level_3
  
     visit edit_product_url(product)
  
     fill_in 'Description', with: "This"
  
     click_button 'Update Product' 
      
     expect(page).to have_text('error')
  end
end
