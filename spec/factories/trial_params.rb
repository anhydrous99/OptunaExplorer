FactoryBot.define do
  factory :trial_param do
    param_name { Faker::FunnyName.name }
    param_value { Faker::Number.normal mean: 50, standard_deviation: 3.5 }
    distribution_json { {fact: Faker::ChuckNorris.fact}.to_json }
  end
end
