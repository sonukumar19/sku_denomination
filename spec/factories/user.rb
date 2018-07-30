FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user1_#{n}@example.com" }
    password "password123"
    first_name "mayank"
    last_name "kumar"

    after(:create) { |user| user.confirm }
  end
end