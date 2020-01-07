require 'faker'
require 'forgery_ja'

FactoryBot.define do
  factory :user_delivery do
    last_name                { ForgeryJa(:name).last_name }
    first_name               { ForgeryJa(:name).first_name }
    last_name_kana           { ForgeryJa(:name).last_name(to: ForgeryJa::KANA) }
    first_name_kana          { ForgeryJa(:name).first_name(to: ForgeryJa::KANA) }
    postal_number            { Faker::Number.number(digits: 7) }
    city                     { ForgeryJa(:address).city }
    block                    { ForgeryJa(:address).street_number }
    building_name            { "テストレジデンス" }
    phone_number             { Faker::Number.number(digits: Faker::Number.between(from: 9, to: 10)) }
  end
end
