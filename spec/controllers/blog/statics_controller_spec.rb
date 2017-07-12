require 'rails_helper'

RSpec.describe Blog::StaticsController, type: :controller do
  it "Renders about page with about params" do
    get :show, params: {id: "about"}
    expect(response).to render_template('about')
  end

  it "Renders home page with index params" do
    get :show, params: {id: "index"}
    expect(response).to render_template('index')
  end
end
