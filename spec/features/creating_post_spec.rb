require 'rails_helper'

RSpec.feature "Adam can create new posts" do
  let!(:category) { FactoryGirl.create(:category, category_name: "Photo Walk") }

  scenario "with valid attributes" do
    visit new_post_path
    fill_in "post_title", with: "Crossing the Rainbow Bridge to Odaiba"
    click_button "new-block"

    fill_in "postyear", with: "2016"
    select "April", from: "postmonth"
    select "10", from: "postday"
    choose "Photo Walk"

    click_button "Create Post!"
    expect(page.current_url).to eq new_post_url
  end
end
