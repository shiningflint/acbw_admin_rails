require 'rails_helper'

RSpec.describe Markas::ApplicationController, type: :controller do
  context "non-users" do
    it "are unable to access the index action" do
      get :index
      expect(response).to redirect_to new_session_path
    end
  end
end
