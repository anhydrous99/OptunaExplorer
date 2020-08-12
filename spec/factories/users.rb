FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    username { Faker::Internet.username.gsub("_", "h").gsub(".", "a") }
    password { Faker::Internet.password }
  end
end
