FactoryBot.define do
  factory :card_address do
    token {"tok_abcdefghijk00000000000000000"}
    postal { '123-4567' }
    prefecture_id { 2 }
    city { '東京都' }
    address { '1-1-1' }
    building_name { '東京ハイツ' }
    phone { '09012345678' }
  end
end
