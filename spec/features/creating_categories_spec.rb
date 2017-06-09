require 'rails_helper'

RSpec.feature "Adam can add a new category" do
  let(:category) { FactoryGirl.create :category }
  before do
    visit categories_path
    click_link "New Category"
  end

  scenario "with valid attributes" do
    fill_in "category_category_name", with: "Banana posts"
    click_button "Create Category"

    expect(page.current_url).to eq categories_url
    expect(page).to have_content "Category created successfully."
    expect(page).to have_content "Banana posts"
  end

  scenario "not with invalid attributes" do
    click_button "Create Category"
    expect(page).to have_content "Category name can't be blank"
  end
end
