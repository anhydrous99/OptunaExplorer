FactoryBot.define do
  factory :trial_user_attribute do
    key { Faker::Name.name }
    value_json { {fact: Faker::ChuckNorris.fact}.to_json }
    trial
  end
end
