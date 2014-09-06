# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :specialty do
    sequence(:name){|n| "Specialty #{n}"}
  end
end
