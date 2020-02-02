require 'faker'

FactoryBot.define do
  factory :user_payment do
    id              { Faker::Number.number(digits: Faker::Number.between(from: 1, to: 10)) }
    customer_id     { "cus_" + Faker::Crypto.md5 }
    card_id         { "car_" + Faker::Crypto.md5 }
  end
end
