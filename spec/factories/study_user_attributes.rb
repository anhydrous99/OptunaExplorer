FactoryBot.define do
  factory :study_user_attribute do
    key { Faker::Name.name }
    value_json { {fact: Faker::ChuckNorris.fact}.to_json }
    study
  end
end
