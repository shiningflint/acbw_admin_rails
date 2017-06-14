require 'rails_helper'
require 'helpers/spec_test_helper'

RSpec.configure do |config|
  config.include SpecTestHelper, type: :controller
end

RSpec.describe Markas::ApplicationController, type: :controller do
  let!(:adam) { FactoryGirl.create :user }
  context "non-users" do
    it "are unable to access the index action" do
      get :index
      expect(response).to redirect_to markas_login_path
    end
  end

  context "users" do
    it "are able to access the index action" do
      login(adam)
      get :index
      expect(response).to redirect_to markas_posts_path
    end
  end
end
