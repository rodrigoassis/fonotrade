# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :institution do
    sequence(:name){|n| "Institution #{n}"}
    active false
  end
end
