require 'rails_helper'

RSpec.describe "blog/statics/index.html.erb" do
  let(:image_url) { "https://s3-ap-southeast-1.amazonaws.com/wpacbw/uploads/2016/12/s_IMG_20161106_140903.jpg" }
  let(:category) { FactoryGirl.create :category, category_name: "Tokyo Cycling Diary" }
  let(:post) { FactoryGirl.create :post, category: category, thumb_image: image_url, title: 'Wadabori Park' }

  before do
    assign :category, category
    assign :posts, [post]
    render
  end

  it "Shows tokyo cycling diary posts" do
    expect(rendered).to have_content 'Wadabori Park'
  end
end
