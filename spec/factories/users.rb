FactoryBot.define do
  factory :user do
    nickname              { Faker::Japanese::Name.name }
    email                 { Faker::Internet.email }
    password              { Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1) }
    password_confirmation { password }
    family_name           { Faker::Japanese::Name.last_name }
    first_name            { Faker::Japanese::Name.first_name }
    kana_family_name      { family_name.yomi }
    kana_first_name       { first_name.yomi }
    birthday              { Faker::Date.between(from: '1930-1-1', to: '2019-12-31') }
  end
end
