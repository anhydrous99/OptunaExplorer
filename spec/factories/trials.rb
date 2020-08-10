FactoryBot.define do
  factory :trial do
    number { Faker::Number.number digits: 2 }
    study
    state { %w(RUNNING COMPLETE PRUNED FAIL WAITING).sample }
    value { Faker::Number.normal mean: 50, standard_deviation: 3.5 }
    datetime_start { Faker::Date.backward days: 10 }
    datetime_complete { Faker::Date.forward days: 1 }
  end
end
