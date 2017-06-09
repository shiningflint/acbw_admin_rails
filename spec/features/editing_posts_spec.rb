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

RSpec.feature "Adam can edit existing post" do
  let!(:category) { FactoryGirl.create(:category, category_name: "Life in Tokyo") }
  let!(:new_category) { FactoryGirl.create(:category, category_name: "Tokyo Cycling Diary") }
  let!(:post) { FactoryGirl.create :post, category: category }

  before do
    visit posts_path
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

    sleep 1
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
