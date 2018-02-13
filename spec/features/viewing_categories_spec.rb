require 'rails_helper'

RSpec.feature "Anyone can view posts" do
  let!(:category) { FactoryBot.create :category }
  let!(:post) { FactoryBot.create :post, category: category }
  let!(:post2) { FactoryBot.create :post,
    category: category,
    status: "unpublished",
    title: "Unpublished post"
  }

  scenario "successfully" do
    visit "/blog/categories/tokyo-cycling-diary"
    expect(page).to have_content "Tokyo Cycling Diary"
    expect(page).to have_content "A test post"
    expect(page).to_not have_content "Unpublished post"
    expect(page.title).to eq "Tokyo Cycling Diary | ACBW Rolling Around Tokyo"
  end
end
