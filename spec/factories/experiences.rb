# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :experience do
    year 1990
    association :course, factory: :course
    association :professional, factory: :professional
  end
end
