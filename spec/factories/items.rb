FactoryBot.define do
  factory :item do
    name { Faker::JapaneseMedia::DragonBall.character }
    description { Faker::TvShows::Friends.quote }
    unit_price { Faker::Number.decimal(l_digits: 2) }
    merchant
  end
end