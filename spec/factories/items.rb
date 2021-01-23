FactoryBot.define do
  factory :item do
    name {Faker::Lorem.word}
    info {Faker::Lorem.sentence}
    price {Random.rand(300 .. 9999999)}
    category_id {Random.rand(1 .. 10)}
    condition_id {Random.rand(1 .. 6)}
    charge_id {Random.rand(1 .. 2)}
    prefecture_id {Random.rand(1 .. 47)}
    ship_day_id {Random.rand(1 .. 3)}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
