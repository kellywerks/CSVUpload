require 'spec_helper'

feature "Adding a new product" do
  scenario "Add a new product with validated fields" do
    visit '/products/new'
    fill_in 'Name', :with => 'Capybara Test Item'
    fill_in 'Price', :with => '20'
    fill_in 'Desc', :with => "Testing adding a new product description"
    click_button 'Create Product'
    expect(page).to have_content 'Capybara Test Item'
  end
end

feature "Verifying price is numeric on a new product" do
  scenario "Add a new product with non-numeric price field and expect errors" do
    visit '/products/new'
    fill_in 'Name', :with => 'Capybara Test Item'
    fill_in 'Price', :with => ''
    fill_in 'Desc', :with => "Testing adding a new product description"
    click_button 'Create Product'
    expect(page).to have_content 'Price is not a number'
  end
end

feature "Destroying a product" do
  scenario "Destroying a product" do
    visit '/products/new'
    fill_in 'Name', :with => 'Capybara Test Item'
    fill_in 'Price', :with => '20'
    fill_in 'Desc', :with => "Testing adding a new product description"
    click_button 'Create Product'
    click_link 'Capybara Test Item'
    click_button 'delete'
    expect(page).to have_no_content 'Capybara Test Item'
  end
end

feature "Editing a product" do
  scenario "Edit a product with validated fields" do
    visit '/products/new'
    fill_in 'Name', :with => 'Capybara Test Item'
    fill_in 'Price', :with => '20'
    fill_in 'Desc', :with => "Testing adding a new product description"
    click_button 'Create Product'
    click_link 'Capybara Test Item'
    click_link 'edit'
    fill_in 'Name', :with => 'Changed Test Item'
    click_button 'Update Product'
    expect(page).to have_content 'Changed Test Item'
    expect(page).to have_no_content 'Capybara Test Item'
  end
end
