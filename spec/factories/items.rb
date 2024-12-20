FactoryBot.define do
  factory :item do
    association :user
    name            { Faker::Lorem.characters }
    explanation     { Faker::Lorem.paragraph }
    category_id     { rand(2..11) }
    state_id        { rand(2..7) }
    fee_id          { rand(2..3) }
    region_id       { rand(2..48) }
    delivery_id     { rand(2..4) }
    price           { rand(300..9_999_999) }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/天使の画像.jpg'), filename: 'test_image.jpg')
    end
  end
end
