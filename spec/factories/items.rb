FactoryBot.define do
  factory :item do
    name               {Faker::Name.initials(number: 4)}
    description        { 'こんにちは' }
    category_id        { 2 }
    condition_id       { 2 }
    shipping_id        { 2 }
    area_id            { 2 }
    day_id             { 2 }
    price              { 888 }

    association :user 

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpeg'), filename: 'test_image.jpeg')
    end
  end
end
