require "rails_helper"
require "rack_session_access/capybara"

RSpec.feature "Adam can logout from markas page" do
  let!(:adam) { FactoryGirl.create(:user) }

  scenario "successfully" do
    page.set_rack_session(user_id: adam.id)
    visit markas_posts_path
    click_link "nav-logout"
    expect(page.current_url).to eq markas_login_url
  end
end
