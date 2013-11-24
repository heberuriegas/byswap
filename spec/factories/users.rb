# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    provider "facebook"
    uid { generate :random_number }
    name { generate :full_name }
    email { generate :email }
    address { generate :address }
    latitude { generate :latitude }
    longitude { generate :longitude }
  end
end
