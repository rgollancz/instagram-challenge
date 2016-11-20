FactoryGirl.define do
  factory :comment do
    content "MyString"
  end
  factory :user do |u|
    u.sequence(:email) { |n| "user#{n}@email.com"}
    u.password "password123"
  end
end
