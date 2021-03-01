FactoryBot.define do
  factory :order_address do
    postal_code   { '123-4567' }
    prefecture_id { 5 }
    city_name     { '東京都' }
    address_num   { '1-1' }
    building      { '東京ハイツ' }
    phone_num     { '08045678989' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
