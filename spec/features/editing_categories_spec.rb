require 'rails_helper'
require "rack_session_access/capybara"

RSpec.feature "edit existing category" do
  context "Adam can" do
    let!(:adam) { FactoryBot.create :user }
    let!(:category) { FactoryBot.create :category, category_name: "Life in Tokyo" }

    before do
      page.set_rack_session(user_id: adam.id)
      visit markas_categories_path
    end

    scenario "with valid attributes" do
      click_link "Life in Tokyo"
      fill_in "category_category_name", with: "Potato posts"
      click_button "Update Category"

      expect(page).to have_content "Category updated successfully."
      expect(page).to have_content "Potato posts"
      expect(page).to_not have_content "Life in Tokyo"
    end

    scenario "through the edit button" do
      click_link "Edit"
      fill_in "category_category_name", with: "Banana posts"
      click_button "Update Category"

      expect(page).to have_content "Category updated successfully."
      expect(page).to have_content "Banana posts"
      expect(page).to_not have_content "Life in Tokyo"
    end

    scenario "not with invalid attributes" do
      click_link "Life in Tokyo"
      fill_in "category_category_name", with: ""
      click_button "Update Category"

      expect(page).to have_content "Category name can't be blank"
    end
  end

  context "others cannot" do
    let!(:adam) { FactoryBot.create :user }
    let!(:guest) { FactoryBot.create :user, name: "guest" }
    let!(:category) { FactoryBot.create :category, category_name: "Life in Tokyo" }

    before do
      page.set_rack_session(user_id: guest.id)
      visit markas_categories_path
    end

    scenario "with valid attributes" do
      click_link "Life in Tokyo"
      fill_in "category_category_name", with: "Potato posts"
      click_button "Update Category"

      expect(page).to have_content "You are not authorized to manipulate categories!"
    end
  end
end
