FactoryGirl.define do
  factory :post do
    title "A test post"
    content "<div class=\"post-block\"><p>Insert content here</p></div><div class=\"post-block\"><p>Block</p></div>"
    status "published"
    date "2017-06-07"
    slug "a-test-post"
    main_image "https://s3-ap-southeast-1.amazonaws.com/wpacbw/uploads/2016/12/s_IMG_20161106_140903.jpg"
  end
end
