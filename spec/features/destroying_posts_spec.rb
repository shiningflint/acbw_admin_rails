require 'rails_helper'

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

RSpec.feature "Adam can delete existing post" do
  let!(:category) { FactoryGirl.create(:category, category_name: "Life in Tokyo") }
  let!(:new_category) { FactoryGirl.create(:category, category_name: "Tokyo Cycling Diary") }
  let!(:post) { FactoryGirl.create :post, category: category }

  scenario "successfully", js: true do
    visit posts_path
    click_link "A test post"
    expect(page).to have_selector("#edit-post")
    click_link "Delete Post"
    page.driver.browser.switch_to.alert.accept
    sleep 1
    expect(page).to have_content "Post has been deleted successfully."
    expect(page).to_not have_content "A test post"
  end
end
