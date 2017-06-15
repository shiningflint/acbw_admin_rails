require 'rails_helper'

RSpec.feature "Anyone can view posts" do
  let!(:category) { FactoryGirl.create :category }
  let!(:post) { FactoryGirl.create :post, category: category }

  scenario "successfully" do
    visit "/blog/a-test-post"
    expect(page).to have_content "A test post"
    expect(page).to have_content "Insert content here"
  end
end
