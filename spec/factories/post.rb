FactoryGirl.define do
  factory :post do
    title "A test post"
    content "<div class=\"post-block\"><p>Insert content here</p></div><div class=\"post-block\"><p>Block</p></div>"
    status "unpublished"
    date "2017-06-07"
    slug "a-test-post"
  end
end
