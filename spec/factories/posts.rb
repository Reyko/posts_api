FactoryGirl.define do
  factory :post do
    content "Just another post"

    association :user
  end

  factory :post_with_comments do
    after(:create) do |post|
      FactoryGirl.create_list(:comment, 3, post: post, user: post.user)
    end
  end
end
