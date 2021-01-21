FactoryBot.define do
  factory :user do
    nickname {Faker::Name.initials(number: 2)}
    email {Faker::Internet.free_email}
    password { 'test1234TEST' }
    password_confirmation { password }
    last_name { "山田" }
    first_name { "太郎" }
    last_name_kana {Faker::Japanese::Name.last_name.yomi}
    first_name_kana {Faker::Japanese::Name.first_name.yomi}
    birth_day { "1980-06-06" }
  end
end
