require 'rails_helper'
require "rack_session_access/capybara"

RSpec.feature "Adam can delete existing category" do
  let!(:adam) { FactoryGirl.create :user }
  let!(:category1) { FactoryGirl.create :category, category_name: "Life in Tokyo" }
  let!(:category2) { FactoryGirl.create :category }

  before do
    page.set_rack_session(user_id: adam.id)
  end

  scenario "successfully" do
    visit markas_categories_path
    click_link "Tokyo Cycling Diary"
    click_link "Delete Category"
    expect(page).to have_content "Category deleted successfully."
    expect(page).to_not have_content "Tokyo Cycling Diary"
    expect(page).to have_content "Life in Tokyo"
  end

  scenario "not if dependent post is present" do
    FactoryGirl.create :post, category: category2
    visit markas_categories_path
    click_link "Tokyo Cycling Diary"
    click_link "Delete Category"
    expect(page).to have_content "Cannot delete record because dependent posts exist"
  end
end
