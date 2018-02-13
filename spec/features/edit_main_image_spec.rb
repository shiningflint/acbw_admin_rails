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

RSpec.feature "Adam can edit the main image" do
  new_url = "https://s3-ap-southeast-1.amazonaws.com/wpacbw/uploads/2016/12/s_IMG_20161106_140639.jpg"
  let!(:adam) { FactoryBot.create :user }
  let!(:category) { FactoryBot.create(:category, category_name: "Tokyo Cycling Diary") }
  let!(:post) { FactoryBot.create :post, category: category }

  scenario "successfully", js: true do
    page.set_rack_session(user_id: adam.id)
    visit markas_posts_path
    click_link "A test post"

    click_button "main-pic"
    prompt = page.driver.browser.switch_to.alert
    prompt.send_keys new_url
    prompt.accept

    expect(page).to have_css("#main-pic-show > img[src*='s_IMG_20161106_140639.jpg']")
    click_button "Update Post!"
    visit "/blog/a-test-post"
    expect(page).to have_css("#post-main-img[src*='s_IMG_20161106_140639.jpg']")
  end
end
