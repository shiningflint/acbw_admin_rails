require 'rails_helper'

RSpec.describe "blog/categories/show.html.erb" do
  let(:temp_image) { "https://s3-ap-southeast-1.amazonaws.com/acbw/assets/acbw_temp.png" }
  let(:image_url) { "https://s3-ap-southeast-1.amazonaws.com/wpacbw/uploads/2016/12/s_IMG_20161106_140903.jpg" }
  let(:category) { FactoryGirl.create :category, category_name: "Tokyo Cycling Diary" }
  let!(:post1) { FactoryGirl.create :post, category: category, thumb_image: image_url }
  let!(:post2) { FactoryGirl.create :post, category: category }

  before do
    assign :category, category
    assign :posts, [post1, post2]
    render
  end

  it "has temp image for posts with no thumbnail" do
    expect(rendered).to have_selector 'img.post-item__img[src="https://s3-ap-southeast-1.amazonaws.com/wpacbw/uploads/2016/12/s_IMG_20161106_140903.jpg"]'
    expect(rendered).to have_selector 'img.post-item__img[src="https://s3-ap-southeast-1.amazonaws.com/acbw/assets/acbw_temp.png"]'
  end

  it "has correct date formatting" do
    expect(rendered).to have_content 'Wed, 2017/06/07'
  end
end
