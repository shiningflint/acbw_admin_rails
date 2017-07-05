require 'rails_helper'

RSpec.feature "Anyone can view static pages" do
  scenario "the about page successfully" do
    visit "/about"
    expect(page).to have_content "About ACBW"
  end

  scenario "any strange link to return 404" do
    visit "/kentang"
    expect(page.status_code).to eq(404)
  end
end
