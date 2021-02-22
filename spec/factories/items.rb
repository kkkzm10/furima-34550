FactoryBot.define do
  factory :item do
    name              {Faker::Name.initials(number: 2)}
    item_info         {'2010年頃に1万円で購入したジャケットです。ライトグレーで傷はありません。合わせやすいのでおすすめです。'}
    category_id       {2}
    status_id         {2}
    shipping_fee_id   {2}
    prefecture_id     {2}
    schedule_id       {2}
    price             {1000}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_img.png'), filename: 'test_img.png')
    end
  end
end
