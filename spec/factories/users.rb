FactoryGirl.define do
  factory :user do
    sequence(:name){ |n| "name#{n}" }
    email "email@gmail.com"
    password "password"
  end
end
