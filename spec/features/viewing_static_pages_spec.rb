require 'rails_helper'

RSpec.feature "Anyone can view static pages" do
  scenario "the about page successfully" do
    visit "/about"
    expect(page).to have_content "About ACBW"
  end
end
