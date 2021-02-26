FactoryBot.define do
  factory :order_address do
    postal_code   { '123-4567' }
    prefecture_id { 5 }
    city_name     { '東京都' }
    address_num   { '1-1' }
    building      { '東京ハイツ' }
    phone_num     { '12345678989' }
    user_id       {3}
    item_id       {5}
  end
end
