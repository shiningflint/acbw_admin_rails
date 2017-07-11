require 'rails_helper'

RSpec.feature "Anyone can view posts" do
  let!(:category) { FactoryGirl.create :category }
  let!(:post) { FactoryGirl.create :post, category: category }
  let!(:post2) { FactoryGirl.create :post,
    category: category,
    status: "unpublished",
    title: "Unpublished post"
  }

  scenario "successfully" do
    visit "/blog/categories/tokyo-cycling-diary"
    expect(page).to have_content "Tokyo Cycling Diary"
    expect(page).to have_content "A test post"
    expect(page).to_not have_content "Unpublished post"
  end
end
