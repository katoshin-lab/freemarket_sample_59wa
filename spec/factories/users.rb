FactoryBot.define do
  factory :user do
    name                     {"testname"}
    email                    {"test@gmail.com"}
    password                 {"0123456"}
    last_name                {"山田"}
    first_name               {"太郎"}
    last_name_kana           {"ヤマダ"}
    first_name_kana          {"タロウ"}
    mobile_phone_number      {"09012345678"}
    birthday                 {"19900101"}
    profile                  {"こんにちは"}
  end
end
