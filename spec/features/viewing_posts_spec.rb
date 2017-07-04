require 'rails_helper'

RSpec.feature "Anyone can view" do
  let!(:category) { FactoryGirl.create :category }
  let!(:post) { FactoryGirl.create :post, category: category }
  let!(:post2) { FactoryGirl.create :post,
    title: "Cycling to Odaiba",
    category: category,
    status: "unpublished",
    slug: "cycling-to-odaiba"
  }

  scenario "published posts successfully" do
    visit "/blog/a-test-post"
    expect(page).to have_content "A test post"
    expect(page).to have_content "Insert content here"
  end

  scenario "not unpublished posts" do
    visit "/blog/cycling-to-odaiba"
    expect(page.status_code).to eq(404)
  end

  scenario "404 on not found title" do
    visit "/blog/banana"
    expect(page.status_code).to eq(404)
  end
end
