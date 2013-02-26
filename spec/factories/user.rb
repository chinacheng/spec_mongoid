# coding: utf-8

FactoryGirl.define do
  factory :user do
    sequence(:name){ |n| "user#{n}" }
    age 20
    password 'password'
    sequence(:email){ |n| "user#{n}@factory.com" }
  end

  factory :user_with_topics do
    
  end
end
