require "rails_helper"

RSpec.feature "Adam can login into markas page" do
  let!(:admin) { FactoryGirl.create(:user) }
  scenario "with correct credentials" do
    visit "/markas/login"
    fill_in "user-input", with: "adam"
    fill_in "password-input", with: "12345@dam"
    click_button "Enter"
    expect(page.current_url).to eq posts_url
  end
  scenario "not with incorrect credentials" do
    visit "/markas/login"
    fill_in "user-input", with: "adam"
    fill_in "password-input", with: "12345adam"
    click_button "Enter"
    expect(page.current_url).to eq new_session_url
  end
end
