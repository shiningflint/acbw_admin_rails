require 'rails_helper'

RSpec.feature "Adam can create new posts" do
  let!(:adam) { FactoryGirl.create(:user) }

  scenario "with valid attributes" do
    visit "/markas"

    fill_in "user-input", with: "adam"
    fill_in "password-input", with: "12345@dam"
    click_button "Enter"
    expect(page.current_url).to eq posts_url
  end
end
