FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {'1a' + Faker::Internet.password(min_length: 6, mix_case: true)}
    password_confirmation {password}
    first_name            { '佐藤' }
    last_name             { '太郎' }
    first_name_reading    { 'カタカナ' }
    last_name_reading     { 'カタカナ' }
    birthday              {Faker::Date.in_date_period}
  end
end