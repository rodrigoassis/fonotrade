# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :qualification do
    sequence(:name){|n| "Qualification #{n}"}
  end
end
