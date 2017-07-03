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

RSpec.feature "Adam inserts a main image" do
  imageURL = "https://s3-ap-southeast-1.amazonaws.com/wpacbw/uploads/2016/12/s_IMG_20161106_140903.jpg"
  let!(:adam) { FactoryGirl.create :user }
  let!(:category) { FactoryGirl.create(:category, category_name: "Life in Tokyo") }
  let!(:new_category) { FactoryGirl.create(:category, category_name: "Tokyo Cycling Diary") }

  scenario "and it shows on the post show page", js: true do
    page.set_rack_session(user_id: adam.id)
    visit new_markas_post_path

    fill_in "post_title", with: "Wadabori Park"
    click_button "new-block"

    fill_in "postyear", with: "2016"
    select "November", from: "postmonth"
    select "6", from: "postday"
    choose "Tokyo Cycling Diary"

    click_button "main-pic"
    prompt = page.driver.browser.switch_to.alert
    prompt.send_keys imageURL
    prompt.accept

    expect(page).to have_css("#main-pic-show > img[src*='s_IMG_20161106_140903.jpg']")
    click_button "Create Post!"
    sleep 1
    visit "/blog/wadabori-park"
    expect(page).to have_css("#post-main-img[src*='s_IMG_20161106_140903.jpg']")
  end
end
