FactoryBot.define do  

  factory :item do
    name                  {"name"}
    seller_id             {"1"}
    detail                {"aaaaaaaaaaaaaaaaa"}
    category_id           {"1"}
    condition_id           {"1"}
    is_seller_shipping    {"1"}
    prefecture_id         {"1"}
    shipping_period_id    {"1"}
    shipping_method_id    {"1"}
    price                 {"10000000"}
    item_status_id        {"1"}
  end

end
