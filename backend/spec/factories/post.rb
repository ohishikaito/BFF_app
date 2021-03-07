FactoryBot.define do
  factory :post do
    name         { 'post_name' }
    sub_name     { 'sub_name' }
    video        { '' }
    image        { '' }
    is_special   { false }
    likes_count  { 5 }
    association  :user

    trait :sub_post do
      test_attribute { 'test_attribute' }
    end
  end

end
