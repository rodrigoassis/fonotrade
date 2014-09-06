# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:name){|n| "User number #{n}" }
    sequence(:email){|n| "user_#{n}@codepolaris.com" }
    password "password"
    password_confirmation "password"
  end
end
