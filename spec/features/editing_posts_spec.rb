require 'rails_helper'
require "rack_session_access/capybara"

RSpec.configure do |config|
  #database cleaner gem setup
  config.use_transactional_fixtures = false

  config.before(:suite) do
  DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
  DatabaseCleaner.start
  end

  config.after(:each) do
  DatabaseCleaner.clean
  end
end

RSpec.feature "edit existing post" do
  context "Adam can" do
    let!(:adam) { FactoryGirl.create :user }
    let!(:category) { FactoryGirl.create(:category, category_name: "Life in Tokyo") }
    let!(:new_category) { FactoryGirl.create(:category, category_name: "Tokyo Cycling Diary") }
    let!(:post) { FactoryGirl.create :post, category: category }

    before do
      page.set_rack_session(user_id: adam.id)
      visit markas_posts_path
      click_link "A test post"
      expect(page).to have_selector("#edit-post")
    end

    scenario "with valid attributes", js: true do
      fill_in "post_title", with: "Wadabori Park"
      click_button "new-block"
      fill_in "postyear", with: "2010"
      select "December", from: "postmonth"
      select "1", from: "postday"
      choose "Tokyo Cycling Diary"
      click_button "Update Post!"

      expect(page).to have_content "Post has been updated successfully."
      expect(page).to have_content "Wadabori Park"
      expect(page).to_not have_content "A test post"
      expect(page).to have_content "Tokyo Cycling Diary"
      expect(page).to_not have_content "Life in Tokyo"
      expect(page).to have_content "2010-12-01"
      expect(page).to_not have_content "2017-06-07"
    end

    scenario "not with invalid attributes", js: true do
      fill_in "post_title", with: ""
      click_button "Update Post!"
      expect(page).to have_content "Title can't be blank"
    end
  end

  context "Guest user cannot" do
    let!(:adam) { FactoryGirl.create :user, name: "adam" }
    let!(:guest) { FactoryGirl.create :user, name: "guest" }
    let!(:category) { FactoryGirl.create(:category, category_name: "Life in Tokyo") }
    let!(:new_category) { FactoryGirl.create(:category, category_name: "Tokyo Cycling Diary") }
    let!(:post) { FactoryGirl.create :post, category: category }

    before do
      page.set_rack_session(user_id: guest.id)
      visit markas_posts_path
      click_link "A test post"
      expect(page).to have_selector("#edit-post")
    end

    scenario "with valid attributes", js: true do
      fill_in "post_title", with: "Wadabori Park"
      click_button "new-block"
      fill_in "postyear", with: "2010"
      select "December", from: "postmonth"
      select "1", from: "postday"
      choose "Tokyo Cycling Diary"
      click_button "Update Post!"

      expect(page).to have_content "You are not authorized to manipulate posts!"
    end
  end
end
