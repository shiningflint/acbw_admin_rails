require 'rails_helper'
require 'helpers/spec_test_helper'

RSpec.configure do |config|
  config.include SpecTestHelper, type: :controller
end

RSpec.describe Markas::PicturesController, type: :controller do
  let!(:adam) { FactoryBot.create :user }

  it "access the url successfully" do
    login(adam)
    get :index
    expect(response).to have_http_status(:success)
  end
end
