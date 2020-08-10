FactoryBot.define do
  factory :trial_value do
    trial
    step { Faker::Number.number digits: 2 }
    value { Faker::Number.normal mean: 50, standard_deviation: 3.5 }
  end
end
