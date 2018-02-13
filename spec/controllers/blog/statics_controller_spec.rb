require 'rails_helper'

RSpec.describe Blog::StaticsController, type: :controller do
  let(:image_url) { "https://s3-ap-southeast-1.amazonaws.com/wpacbw/uploads/2016/12/s_IMG_20161106_140903.jpg" }
  let(:category) { FactoryBot.create :category, category_name: "Tokyo Cycling Diary" }
  let!(:post) { FactoryBot.create :post, category: category, thumb_image: image_url, title: 'Wadabori Park' }

  it "Renders about page with about params" do
    get :show, params: {id: "about"}
    expect(response).to render_template('about')
  end

  it "Renders home page with index params" do
    get :show, params: {id: "index"}
    expect(response).to render_template('index')
  end
end
