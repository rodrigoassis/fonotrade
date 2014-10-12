# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :experience do
    year 1990
    association :course, factory: :course
    association :institution, factory: :institution
    association :qualification, factory: :qualification
    association :professional, factory: :professional
  end
end
