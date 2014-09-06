# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :plan do
    name "MyString"
    association :professional, factory: :professional
  end
end
