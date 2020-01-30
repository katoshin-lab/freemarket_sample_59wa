require 'faker'
require 'securerandom'

FactoryBot.define do
  factory :sns_credential do
    id              { Faker::Number.number(digits: Faker::Number.between(from: 1, to: 10)) }
    uid             { Faker::Number.number(digits: Faker::Number.between(from: 1, to: 10)) }
    provider        { "facebook" }
    name            { Faker::Name.first_name }
    email           { Faker::Internet.email }
    token           { SecureRandom.uuid }
  end
end