require 'faker'
require 'forgery_ja'

FactoryBot.define do
  factory :user do
    name                     { Faker::Alphanumeric.alphanumeric(number: 20) }
    email                    { ForgeryJa('email').address }
    password                 { Faker::Alphanumeric.alphanumeric(number: 10) }
    last_name                { ForgeryJa(:name).last_name }
    first_name               { ForgeryJa(:name).first_name }
    last_name_kana           { ForgeryJa(:name).last_name(to: ForgeryJa::KANA) }
    first_name_kana          { ForgeryJa(:name).first_name(to: ForgeryJa::KANA) }
    mobile_phone_number      { Faker::Number.number(digits: 10) }
    birthday                 { "2000-01-01" }
    profile                  { Faker::Lorem.sentence(word_count: 3) }
  end
end
