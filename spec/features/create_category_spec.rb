require 'spec_helper'

describe 'Adding a category' do

  it 'shows the categories details in a list' do
    user_admin = User.create!(user_details(admin: true))
    sign_in_user(user_admin)

    visit products_path

    click_link 'New category'

    fill_in "category_name", with: "Home"
    select "1", from: "category_level"

    click_button 'Create Category'

    category = Category.find_by(name: "Home")

    expect(page).to have_text("Home")
    expect(page).to have_text(category.id)
  end	

end