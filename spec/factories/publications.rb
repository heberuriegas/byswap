# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :publication do
    amount { generate :random_number }
    amount_currency { generate :random_currency }
    expires_at { generate :random_number }
    association :user
  end
end
