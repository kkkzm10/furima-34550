FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {'test@example.com'}
    password              {'1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name           {'山田' }
    first_name            {'太郎' }
    family_name_jpn       {'ヤマダ'}
    first_name_jpn        {'タロウ'}
    birthday              {Faker::Date.in_date_period}
  end
end