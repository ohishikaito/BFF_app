FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "#{n}_" + Faker::Internet.email }
    first_name       { Faker::Name.first_name }
    last_name        { Faker::Name.last_name }
    password         { Faker::Internet.password(8) }
  end
end
