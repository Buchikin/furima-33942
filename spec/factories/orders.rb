FactoryBot.define do
  Faker::Config.locale = :ja
  factory :order do
    token {"tok_abcdefghijk00000000000000000"}
    zip {Faker::Address.zip}
    prefecture_id {Random.rand(1 .. 47)}
    city {Faker::Address.city}
    house_num {"1-1-1"}
    building {"なんばスカイオ"}
    phone_num {Faker::Number.number(digits: 11)}
    user_id {Random.rand(1 .. 10)}
    item_id {Random.rand(1 .. 10)}
  end
end
