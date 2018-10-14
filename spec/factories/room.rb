FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "TEST#{n}@example.com"}
    sequence(:password) { |n| "password"}
  end
end