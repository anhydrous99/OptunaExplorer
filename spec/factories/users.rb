FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    username { Faker::Internet.username.gsub("_", "h") }
    password { Faker::Internet.password }
  end
end
