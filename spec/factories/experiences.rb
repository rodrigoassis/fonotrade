# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :experience do
    name "MyString"
    year 1990
    institute "MyString"
    association :professional, factory: :professional
  end
end
