FactoryBot.define do
  factory :post do
    name         { 'post_name' }
    sub_name     { 'sub_name' }
    video        { '' }
    image        { '' }
    is_special   { false }
    likes_count  { 5 }
    user

    trait :sub_post do
      test_attribute { 'test_attribute' }
    end

    trait :with_likes do
      after(:create) { |post| create_list(:like, 5, post: post) }
    end
  end
end
