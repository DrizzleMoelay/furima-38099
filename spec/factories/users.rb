FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    family_name           {"たなか"}
    family_name_kana      {"タナカ"}
    first_name            {"ゆきこ"}
    first_name_kana       {"ユキコ"}
    email                 {Faker::Internet.free_email}
    password              {"12345a"}
    password_confirmation {password}
    birth_day             {Faker::Date.birthday}
  end
end