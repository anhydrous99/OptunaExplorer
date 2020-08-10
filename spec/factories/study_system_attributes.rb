FactoryBot.define do
  factory :study_system_attribute do
    key { Faker::Name.name }
    value_json { {fact: Faker::ChuckNorris.fact}.to_json }
    study
  end
end
