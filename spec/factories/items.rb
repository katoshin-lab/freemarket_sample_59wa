FactoryBot.define do  

  factory :item do
    name                  { Faker::Name.name } 
    seller_id             {"1"}
    detail                { Faker::String.random(length: 1..1000) }
    category_id           {"1"}
    condition_id           {"1"}
    is_seller_shipping    {"1"}
    prefecture_id         {"1"}
    shipping_period_id    {"1"}
    shipping_method_id    {"1"}
    price                 { Faker::Number.within(range: 300..9999999) }
    item_status_id        {"1"}
  end

end
