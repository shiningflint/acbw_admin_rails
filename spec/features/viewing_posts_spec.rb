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
    expect(page).to have_content "Looks like this page has rolled away"
  end

  scenario "404 on not found title" do
    visit "/blog/banana"
    expect(page.status_code).to eq(404)
    expect(page).to have_content "Looks like this page has rolled away"
  end
end
