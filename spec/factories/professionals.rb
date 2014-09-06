# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :professional do
    sequence(:name){|n| "Professional #{n}"}
    cpf "124.206.717-59"
    sequence(:email){|n| "professional_#{n}@codepolaris.com"}
    sequence(:crfa){|n| "crfa_#{n}"}
    cep "12345-123"
    neighborhood "Andaraí"
    city "Rio de Janeiro"
    state "Rio de Janeiro"
    address "MyString"
    complement "MyString"
  end
end
